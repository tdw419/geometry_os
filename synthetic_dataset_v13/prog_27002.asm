; DESCRIPTION: Creates a black rectangular region at (326, 74) spanning 75 by 97 pixels.
; PLAN: r0=326(x), r1=74(y), r2=75(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 74
LDI r2, 75
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
