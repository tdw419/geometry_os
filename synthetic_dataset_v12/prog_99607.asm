; DESCRIPTION: Creates a yellow rectangular region at (132, 134) spanning 39 by 36 pixels.
; PLAN: r0=132(x), r1=134(y), r2=39(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 134
LDI r2, 39
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
