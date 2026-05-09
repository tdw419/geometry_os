; DESCRIPTION: Places a orange 65x43 rectangle at position (35, 44).
; PLAN: r0=35(x), r1=44(y), r2=65(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 44
LDI r2, 65
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
