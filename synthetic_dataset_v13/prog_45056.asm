; DESCRIPTION: Creates a magenta rectangular region at (392, 3) spanning 65 by 33 pixels.
; PLAN: r0=392(x), r1=3(y), r2=65(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 3
LDI r2, 65
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
