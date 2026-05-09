; DESCRIPTION: Composite: Draws a green line from (221, 71) to (401, 26) then Places a green dot at position (463, 135) then Places a blue circle of radius 36 at center (175, 154).
; PLAN: r0=221(x1), r1=71(y1), r2=401(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=463(x), r6=135(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=175(x), r11=154(y), r12=36(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 221
LDI r1, 71
LDI r2, 401
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 135
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 175
LDI r11, 154
LDI r12, 36
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
