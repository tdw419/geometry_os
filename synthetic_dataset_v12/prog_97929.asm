; DESCRIPTION: Creates a blue rectangular region at (42, 143) spanning 20 by 105 pixels.
; PLAN: r0=42(x), r1=143(y), r2=20(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 143
LDI r2, 20
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
