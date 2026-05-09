; DESCRIPTION: Creates a magenta rectangular region at (170, 198) spanning 16 by 33 pixels.
; PLAN: r0=170(x), r1=198(y), r2=16(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 198
LDI r2, 16
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
