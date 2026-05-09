; DESCRIPTION: Creates a yellow rectangular region at (51, 117) spanning 59 by 55 pixels.
; PLAN: r0=51(x), r1=117(y), r2=59(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 117
LDI r2, 59
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
