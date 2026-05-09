; DESCRIPTION: Creates a green rectangular region at (161, 213) spanning 15 by 19 pixels.
; PLAN: r0=161(x), r1=213(y), r2=15(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 213
LDI r2, 15
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
