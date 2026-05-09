; DESCRIPTION: Creates a orange rectangular region at (124, 93) spanning 67 by 84 pixels.
; PLAN: r0=124(x), r1=93(y), r2=67(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 93
LDI r2, 67
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
