; DESCRIPTION: Composite: Places a magenta line segment connecting (135, 224) to (178, 150) then Sets a single cyan pixel at (509, 63).
; PLAN: r0=135(x1), r1=224(y1), r2=178(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=509(x), r6=63(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 135
LDI r1, 224
LDI r2, 178
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 509
LDI r6, 63
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
