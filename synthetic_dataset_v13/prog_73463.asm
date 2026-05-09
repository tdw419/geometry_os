; DESCRIPTION: Creates a magenta rectangular region at (286, 75) spanning 50 by 70 pixels.
; PLAN: r0=286(x), r1=75(y), r2=50(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 75
LDI r2, 50
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
