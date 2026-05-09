; DESCRIPTION: Composite: Draws a blue rectangle at (394, 99) with width 99 and height 23 then Renders a red line between points (224, 208) and (257, 224).
; PLAN: r0=394(x), r1=99(y), r2=99(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=224(x1), r6=208(y1), r7=257(x2), r8=224(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 99
LDI r2, 99
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 208
LDI r7, 257
LDI r8, 224
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
