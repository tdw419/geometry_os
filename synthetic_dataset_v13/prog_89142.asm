; DESCRIPTION: Creates a yellow rectangular region at (240, 131) spanning 79 by 22 pixels.
; PLAN: r0=240(x), r1=131(y), r2=79(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 131
LDI r2, 79
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
