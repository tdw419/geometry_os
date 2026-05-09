; DESCRIPTION: Composite: Renders a orange disk with center (281, 166) and radius 72 then Places a red dot at position (377, 32) then Places a magenta line segment connecting (328, 252) to (97, 31).
; PLAN: r0=281(x), r1=166(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=377(x), r6=32(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=328(x1), r11=252(y1), r12=97(x2), r13=31(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 166
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 377
LDI r6, 32
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 328
LDI r11, 252
LDI r12, 97
LDI r13, 31
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
