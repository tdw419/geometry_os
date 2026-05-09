; DESCRIPTION: Composite: Places a blue line segment connecting (129, 127) to (163, 228) then Creates a orange circular shape at (487, 88) with radius 10 then Places a orange dot at position (404, 103).
; PLAN: r0=129(x1), r1=127(y1), r2=163(x2), r3=228(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=487(x), r6=88(y), r7=10(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=404(x), r11=103(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 129
LDI r1, 127
LDI r2, 163
LDI r3, 228
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 88
LDI r7, 10
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 404
LDI r11, 103
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
