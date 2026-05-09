; DESCRIPTION: Composite: Places a yellow dot at position (240, 33) then Places a green circle of radius 11 at center (473, 159) then Places a cyan line segment connecting (68, 219) to (362, 190).
; PLAN: r0=240(x), r1=33(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=473(x), r6=159(y), r7=11(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=68(x1), r11=219(y1), r12=362(x2), r13=190(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 240
LDI r1, 33
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 473
LDI r6, 159
LDI r7, 11
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 68
LDI r11, 219
LDI r12, 362
LDI r13, 190
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
