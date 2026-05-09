; DESCRIPTION: Creates a yellow rectangular region at (310, 180) spanning 98 by 19 pixels.
; PLAN: r0=310(x), r1=180(y), r2=98(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 180
LDI r2, 98
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
