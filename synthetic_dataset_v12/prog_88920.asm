; DESCRIPTION: Creates a blue rectangular region at (352, 22) spanning 64 by 93 pixels.
; PLAN: r0=352(x), r1=22(y), r2=64(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 22
LDI r2, 64
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
