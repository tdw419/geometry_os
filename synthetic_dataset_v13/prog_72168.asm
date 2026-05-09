; DESCRIPTION: Creates a blue rectangular region at (271, 72) spanning 81 by 120 pixels.
; PLAN: r0=271(x), r1=72(y), r2=81(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 72
LDI r2, 81
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
