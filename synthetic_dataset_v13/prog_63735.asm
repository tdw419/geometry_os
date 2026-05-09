; DESCRIPTION: Composite: Creates a green circular shape at (80, 52) with radius 12 then Renders a green box of size 52x10 starting at (155, 217) then Sets a single red pixel at (150, 226).
; PLAN: r0=80(x), r1=52(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=155(x), r6=217(y), r7=52(width), r8=10(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=150(x), r11=226(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 80
LDI r1, 52
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 155
LDI r6, 217
LDI r7, 52
LDI r8, 10
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 226
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
