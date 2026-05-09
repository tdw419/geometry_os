; DESCRIPTION: Creates a magenta rectangular region at (327, 3) spanning 70 by 90 pixels.
; PLAN: r0=327(x), r1=3(y), r2=70(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 3
LDI r2, 70
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
