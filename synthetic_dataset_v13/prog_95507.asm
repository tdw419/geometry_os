; DESCRIPTION: Composite: Places a cyan line segment connecting (409, 228) to (310, 155) then Places a red dot at position (398, 191) then Creates a green circular shape at (136, 112) with radius 50.
; PLAN: r0=409(x1), r1=228(y1), r2=310(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=398(x), r6=191(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=136(x), r11=112(y), r12=50(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 409
LDI r1, 228
LDI r2, 310
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 191
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 136
LDI r11, 112
LDI r12, 50
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
