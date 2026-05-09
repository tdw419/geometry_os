; DESCRIPTION: Composite: Renders a cyan box of size 12x108 starting at (340, 56) then Places a red line segment connecting (107, 201) to (128, 214).
; PLAN: r0=340(x), r1=56(y), r2=12(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=107(x1), r6=201(y1), r7=128(x2), r8=214(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 340
LDI r1, 56
LDI r2, 12
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 201
LDI r7, 128
LDI r8, 214
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
