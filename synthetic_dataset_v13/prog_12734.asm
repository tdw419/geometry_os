; DESCRIPTION: Creates a magenta rectangular region at (95, 189) spanning 110 by 60 pixels.
; PLAN: r0=95(x), r1=189(y), r2=110(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 189
LDI r2, 110
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
