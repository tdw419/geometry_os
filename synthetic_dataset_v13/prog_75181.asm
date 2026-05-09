; DESCRIPTION: Creates a black rectangular region at (359, 205) spanning 120 by 20 pixels.
; PLAN: r0=359(x), r1=205(y), r2=120(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 205
LDI r2, 120
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
