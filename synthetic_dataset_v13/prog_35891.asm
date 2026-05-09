; DESCRIPTION: Creates a blue rectangular region at (42, 81) spanning 87 by 86 pixels.
; PLAN: r0=42(x), r1=81(y), r2=87(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 81
LDI r2, 87
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
