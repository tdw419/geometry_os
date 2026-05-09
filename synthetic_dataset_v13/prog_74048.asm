; DESCRIPTION: Creates a magenta rectangular region at (329, 152) spanning 110 by 87 pixels.
; PLAN: r0=329(x), r1=152(y), r2=110(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 152
LDI r2, 110
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
