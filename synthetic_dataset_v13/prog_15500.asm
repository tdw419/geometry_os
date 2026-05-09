; DESCRIPTION: Creates a blue rectangular region at (367, 31) spanning 42 by 94 pixels.
; PLAN: r0=367(x), r1=31(y), r2=42(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 31
LDI r2, 42
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
