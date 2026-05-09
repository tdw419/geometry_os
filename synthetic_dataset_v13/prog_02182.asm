; DESCRIPTION: Creates a green rectangular region at (352, 97) spanning 107 by 96 pixels.
; PLAN: r0=352(x), r1=97(y), r2=107(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 97
LDI r2, 107
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
