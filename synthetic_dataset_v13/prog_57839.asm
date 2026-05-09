; DESCRIPTION: Creates a magenta rectangular region at (55, 164) spanning 55 by 12 pixels.
; PLAN: r0=55(x), r1=164(y), r2=55(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 164
LDI r2, 55
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
