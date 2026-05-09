; DESCRIPTION: Composite: Places a black line segment connecting (19, 32) to (356, 195) then Draws a black circle centered at (245, 49) with radius 27.
; PLAN: r0=19(x1), r1=32(y1), r2=356(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=49(y), r7=27(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 19
LDI r1, 32
LDI r2, 356
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 49
LDI r7, 27
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
