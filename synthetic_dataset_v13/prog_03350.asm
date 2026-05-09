; DESCRIPTION: Creates a magenta rectangular region at (288, 83) spanning 90 by 86 pixels.
; PLAN: r0=288(x), r1=83(y), r2=90(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 83
LDI r2, 90
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
