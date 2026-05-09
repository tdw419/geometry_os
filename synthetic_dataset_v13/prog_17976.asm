; DESCRIPTION: Creates a blue rectangular region at (54, 42) spanning 60 by 117 pixels.
; PLAN: r0=54(x), r1=42(y), r2=60(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 42
LDI r2, 60
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
