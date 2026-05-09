; DESCRIPTION: Creates a purple rectangular region at (184, 87) spanning 59 by 29 pixels.
; PLAN: r0=184(x), r1=87(y), r2=59(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 87
LDI r2, 59
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
