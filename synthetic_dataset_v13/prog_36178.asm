; DESCRIPTION: Composite: Places a blue circle of radius 68 at center (392, 134) then Creates a green rectangular region at (425, 159) spanning 87 by 93 pixels.
; PLAN: r0=392(x), r1=134(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=425(x), r6=159(y), r7=87(width), r8=93(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 392
LDI r1, 134
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 425
LDI r6, 159
LDI r7, 87
LDI r8, 93
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
