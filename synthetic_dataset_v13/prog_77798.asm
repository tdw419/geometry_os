; DESCRIPTION: Composite: Renders a green box of size 52x115 starting at (88, 39) then Renders a white line between points (380, 67) and (114, 207) then Renders a cyan disk with center (411, 182) and radius 66.
; PLAN: r0=88(x), r1=39(y), r2=52(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=380(x1), r6=67(y1), r7=114(x2), r8=207(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=411(x), r11=182(y), r12=66(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 88
LDI r1, 39
LDI r2, 52
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 67
LDI r7, 114
LDI r8, 207
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 182
LDI r12, 66
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
