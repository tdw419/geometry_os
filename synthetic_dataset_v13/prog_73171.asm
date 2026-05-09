; DESCRIPTION: Composite: Places a magenta dot at position (148, 216) then Renders a orange disk with center (92, 152) and radius 23 then Places a magenta line segment connecting (231, 180) to (456, 185).
; PLAN: r0=148(x), r1=216(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=92(x), r6=152(y), r7=23(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=231(x1), r11=180(y1), r12=456(x2), r13=185(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 148
LDI r1, 216
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 92
LDI r6, 152
LDI r7, 23
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 231
LDI r11, 180
LDI r12, 456
LDI r13, 185
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
