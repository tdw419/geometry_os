; DESCRIPTION: Creates a magenta rectangular region at (130, 150) spanning 10 by 80 pixels.
; PLAN: r0=130(x), r1=150(y), r2=10(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 150
LDI r2, 10
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
