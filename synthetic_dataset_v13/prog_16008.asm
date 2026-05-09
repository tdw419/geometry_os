; DESCRIPTION: Creates a magenta rectangular region at (320, 152) spanning 23 by 46 pixels.
; PLAN: r0=320(x), r1=152(y), r2=23(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 152
LDI r2, 23
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
