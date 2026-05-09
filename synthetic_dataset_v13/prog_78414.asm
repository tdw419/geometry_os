; DESCRIPTION: Composite: Sets a single yellow pixel at (33, 240) then Draws a cyan line from (149, 240) to (345, 200) then Places a white 46x43 rectangle at position (297, 177).
; PLAN: r0=33(x), r1=240(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=149(x1), r6=240(y1), r7=345(x2), r8=200(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=297(x), r11=177(y), r12=46(width), r13=43(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 33
LDI r1, 240
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 149
LDI r6, 240
LDI r7, 345
LDI r8, 200
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 177
LDI r12, 46
LDI r13, 43
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
