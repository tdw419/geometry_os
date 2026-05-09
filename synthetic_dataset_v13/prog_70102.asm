; DESCRIPTION: Creates a magenta rectangular region at (386, 21) spanning 52 by 10 pixels.
; PLAN: r0=386(x), r1=21(y), r2=52(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 21
LDI r2, 52
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
