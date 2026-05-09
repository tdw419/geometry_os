; DESCRIPTION: Composite: Places a green line segment connecting (405, 224) to (0, 193) then Places a blue circle of radius 32 at center (35, 50) then Sets a single cyan pixel at (509, 229).
; PLAN: r0=405(x1), r1=224(y1), r2=0(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=35(x), r6=50(y), r7=32(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=509(x), r11=229(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 405
LDI r1, 224
LDI r2, 0
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 50
LDI r7, 32
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 509
LDI r11, 229
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
