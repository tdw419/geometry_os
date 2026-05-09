; DESCRIPTION: Creates a magenta rectangular region at (152, 115) spanning 66 by 59 pixels.
; PLAN: r0=152(x), r1=115(y), r2=66(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 115
LDI r2, 66
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
