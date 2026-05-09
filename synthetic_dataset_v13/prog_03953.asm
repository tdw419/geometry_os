; DESCRIPTION: Creates a blue rectangular region at (42, 87) spanning 75 by 89 pixels.
; PLAN: r0=42(x), r1=87(y), r2=75(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 87
LDI r2, 75
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
