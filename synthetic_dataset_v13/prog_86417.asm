; DESCRIPTION: Creates a magenta rectangular region at (398, 100) spanning 21 by 49 pixels.
; PLAN: r0=398(x), r1=100(y), r2=21(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 100
LDI r2, 21
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
