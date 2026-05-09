; DESCRIPTION: Creates a magenta rectangular region at (130, 164) spanning 31 by 44 pixels.
; PLAN: r0=130(x), r1=164(y), r2=31(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 164
LDI r2, 31
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
