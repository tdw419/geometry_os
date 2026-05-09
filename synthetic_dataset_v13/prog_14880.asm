; DESCRIPTION: Creates a blue rectangular region at (397, 220) spanning 60 by 36 pixels.
; PLAN: r0=397(x), r1=220(y), r2=60(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 220
LDI r2, 60
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
