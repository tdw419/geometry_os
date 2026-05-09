; DESCRIPTION: Creates a magenta rectangular region at (187, 5) spanning 80 by 45 pixels.
; PLAN: r0=187(x), r1=5(y), r2=80(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 5
LDI r2, 80
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
