; DESCRIPTION: Creates a yellow rectangular region at (375, 243) spanning 26 by 11 pixels.
; PLAN: r0=375(x), r1=243(y), r2=26(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 243
LDI r2, 26
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
