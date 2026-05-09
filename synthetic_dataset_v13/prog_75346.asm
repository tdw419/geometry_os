; DESCRIPTION: Creates a magenta rectangular region at (399, 17) spanning 91 by 120 pixels.
; PLAN: r0=399(x), r1=17(y), r2=91(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 17
LDI r2, 91
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
