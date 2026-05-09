; DESCRIPTION: Composite: Places a green line segment connecting (290, 27) to (228, 245) then Creates a yellow circular shape at (145, 108) with radius 27.
; PLAN: r0=290(x1), r1=27(y1), r2=228(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=145(x), r6=108(y), r7=27(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 290
LDI r1, 27
LDI r2, 228
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 108
LDI r7, 27
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
