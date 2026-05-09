; DESCRIPTION: Creates a magenta rectangular region at (52, 152) spanning 39 by 29 pixels.
; PLAN: r0=52(x), r1=152(y), r2=39(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 152
LDI r2, 39
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
