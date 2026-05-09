; DESCRIPTION: Creates a magenta rectangular region at (317, 225) spanning 55 by 29 pixels.
; PLAN: r0=317(x), r1=225(y), r2=55(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 225
LDI r2, 55
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
