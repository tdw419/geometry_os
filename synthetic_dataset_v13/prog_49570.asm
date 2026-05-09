; DESCRIPTION: Composite: Renders a green box of size 99x109 starting at (248, 70) then Sets a single blue pixel at (346, 231).
; PLAN: r0=248(x), r1=70(y), r2=99(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=346(x), r6=231(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 248
LDI r1, 70
LDI r2, 99
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 231
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
