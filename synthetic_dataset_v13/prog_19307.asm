; DESCRIPTION: Creates a blue rectangular region at (338, 196) spanning 10 by 60 pixels.
; PLAN: r0=338(x), r1=196(y), r2=10(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 196
LDI r2, 10
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
