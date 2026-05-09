; DESCRIPTION: Creates a magenta rectangular region at (152, 222) spanning 77 by 22 pixels.
; PLAN: r0=152(x), r1=222(y), r2=77(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 222
LDI r2, 77
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
