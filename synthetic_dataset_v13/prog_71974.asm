; DESCRIPTION: Composite: Places a cyan dot at position (309, 153) then Renders a black box of size 102x97 starting at (118, 159) then Renders a cyan line between points (49, 4) and (33, 240).
; PLAN: r0=309(x), r1=153(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=118(x), r6=159(y), r7=102(width), r8=97(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=49(x1), r11=4(y1), r12=33(x2), r13=240(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 153
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 118
LDI r6, 159
LDI r7, 102
LDI r8, 97
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 49
LDI r11, 4
LDI r12, 33
LDI r13, 240
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
