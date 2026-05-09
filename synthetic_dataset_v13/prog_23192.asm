; DESCRIPTION: Creates a green rectangular region at (213, 33) spanning 97 by 115 pixels.
; PLAN: r0=213(x), r1=33(y), r2=97(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 33
LDI r2, 97
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
