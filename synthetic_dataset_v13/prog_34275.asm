; DESCRIPTION: Composite: Renders a blue disk with center (269, 94) and radius 14 then Places a yellow dot at position (177, 68) then Places a cyan line segment connecting (366, 219) to (28, 19).
; PLAN: r0=269(x), r1=94(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=177(x), r6=68(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=366(x1), r11=219(y1), r12=28(x2), r13=19(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 269
LDI r1, 94
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 177
LDI r6, 68
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 366
LDI r11, 219
LDI r12, 28
LDI r13, 19
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
