; DESCRIPTION: Creates a purple rectangular region at (150, 157) spanning 120 by 67 pixels.
; PLAN: r0=150(x), r1=157(y), r2=120(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 157
LDI r2, 120
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
