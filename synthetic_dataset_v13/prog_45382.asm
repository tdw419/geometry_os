; DESCRIPTION: Creates a blue rectangular region at (210, 36) spanning 42 by 67 pixels.
; PLAN: r0=210(x), r1=36(y), r2=42(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 36
LDI r2, 42
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
