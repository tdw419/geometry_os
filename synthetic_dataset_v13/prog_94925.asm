; DESCRIPTION: Composite: Sets a single white pixel at (220, 150) then Creates a blue rectangular region at (396, 172) spanning 18 by 59 pixels.
; PLAN: r0=220(x), r1=150(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=396(x), r6=172(y), r7=18(width), r8=59(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 220
LDI r1, 150
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 396
LDI r6, 172
LDI r7, 18
LDI r8, 59
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
