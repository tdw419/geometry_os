; DESCRIPTION: Creates a magenta rectangular region at (446, 25) spanning 17 by 119 pixels.
; PLAN: r0=446(x), r1=25(y), r2=17(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 25
LDI r2, 17
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
