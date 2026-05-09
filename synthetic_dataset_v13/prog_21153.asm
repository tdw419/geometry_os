; DESCRIPTION: Creates a blue rectangular region at (338, 117) spanning 60 by 71 pixels.
; PLAN: r0=338(x), r1=117(y), r2=60(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 117
LDI r2, 60
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
