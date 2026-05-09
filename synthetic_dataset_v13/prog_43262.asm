; DESCRIPTION: Creates a magenta rectangular region at (446, 150) spanning 26 by 21 pixels.
; PLAN: r0=446(x), r1=150(y), r2=26(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 150
LDI r2, 26
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
