; DESCRIPTION: Creates a magenta rectangular region at (243, 8) spanning 91 by 99 pixels.
; PLAN: r0=243(x), r1=8(y), r2=91(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 8
LDI r2, 91
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
