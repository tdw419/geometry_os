; DESCRIPTION: Renders a orange box of size 83x35 starting at (396, 142).
; PLAN: r0=396(x), r1=142(y), r2=83(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 142
LDI r2, 83
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
