; DESCRIPTION: Composite: Places a cyan dot at position (224, 86) then Places a green line segment connecting (178, 199) to (256, 181).
; PLAN: r0=224(x), r1=86(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=178(x1), r6=199(y1), r7=256(x2), r8=181(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 224
LDI r1, 86
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 178
LDI r6, 199
LDI r7, 256
LDI r8, 181
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
