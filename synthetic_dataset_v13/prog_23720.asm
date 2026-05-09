; DESCRIPTION: Creates a red rectangular region at (385, 8) spanning 108 by 10 pixels.
; PLAN: r0=385(x), r1=8(y), r2=108(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 8
LDI r2, 108
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
