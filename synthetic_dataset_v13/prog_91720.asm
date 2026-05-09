; DESCRIPTION: Creates a red rectangular region at (470, 43) spanning 35 by 75 pixels.
; PLAN: r0=470(x), r1=43(y), r2=35(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 43
LDI r2, 35
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
