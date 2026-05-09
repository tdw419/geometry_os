; DESCRIPTION: Creates a magenta rectangular region at (108, 65) spanning 111 by 91 pixels.
; PLAN: r0=108(x), r1=65(y), r2=111(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 65
LDI r2, 111
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
