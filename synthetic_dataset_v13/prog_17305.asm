; DESCRIPTION: Creates a magenta rectangular region at (180, 217) spanning 55 by 18 pixels.
; PLAN: r0=180(x), r1=217(y), r2=55(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 217
LDI r2, 55
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
