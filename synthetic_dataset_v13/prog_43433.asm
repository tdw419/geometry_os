; DESCRIPTION: Creates a yellow rectangular region at (265, 37) spanning 35 by 120 pixels.
; PLAN: r0=265(x), r1=37(y), r2=35(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 37
LDI r2, 35
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
