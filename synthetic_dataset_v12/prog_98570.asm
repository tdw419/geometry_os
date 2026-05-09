; DESCRIPTION: Creates a magenta rectangular region at (342, 119) spanning 46 by 83 pixels.
; PLAN: r0=342(x), r1=119(y), r2=46(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 119
LDI r2, 46
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
