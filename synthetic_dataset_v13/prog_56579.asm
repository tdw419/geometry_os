; DESCRIPTION: Creates a yellow rectangular region at (84, 5) spanning 42 by 67 pixels.
; PLAN: r0=84(x), r1=5(y), r2=42(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 5
LDI r2, 42
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
