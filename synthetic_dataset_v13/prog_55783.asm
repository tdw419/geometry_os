; DESCRIPTION: Creates a magenta rectangular region at (253, 56) spanning 80 by 27 pixels.
; PLAN: r0=253(x), r1=56(y), r2=80(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 56
LDI r2, 80
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
