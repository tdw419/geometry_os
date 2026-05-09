; DESCRIPTION: Creates a magenta rectangular region at (214, 144) spanning 77 by 80 pixels.
; PLAN: r0=214(x), r1=144(y), r2=77(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 144
LDI r2, 77
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
