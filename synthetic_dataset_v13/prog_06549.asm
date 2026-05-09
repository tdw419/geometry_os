; DESCRIPTION: Creates a magenta rectangular region at (243, 150) spanning 84 by 12 pixels.
; PLAN: r0=243(x), r1=150(y), r2=84(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 150
LDI r2, 84
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
