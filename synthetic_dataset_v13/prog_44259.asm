; DESCRIPTION: Creates a yellow rectangular region at (362, 131) spanning 119 by 108 pixels.
; PLAN: r0=362(x), r1=131(y), r2=119(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 131
LDI r2, 119
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
