; DESCRIPTION: Composite: Places a green circle of radius 30 at center (145, 68) then Places a magenta line segment connecting (64, 86) to (497, 209).
; PLAN: r0=145(x), r1=68(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=64(x1), r6=86(y1), r7=497(x2), r8=209(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 68
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 64
LDI r6, 86
LDI r7, 497
LDI r8, 209
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
