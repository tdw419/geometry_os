; DESCRIPTION: Creates a magenta rectangular region at (143, 150) spanning 44 by 100 pixels.
; PLAN: r0=143(x), r1=150(y), r2=44(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 150
LDI r2, 44
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
