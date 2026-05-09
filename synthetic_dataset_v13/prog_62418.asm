; DESCRIPTION: Creates a blue rectangular region at (81, 171) spanning 119 by 42 pixels.
; PLAN: r0=81(x), r1=171(y), r2=119(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 171
LDI r2, 119
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
