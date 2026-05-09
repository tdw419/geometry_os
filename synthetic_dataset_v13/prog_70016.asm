; DESCRIPTION: Creates a white rectangular region at (132, 127) spanning 97 by 46 pixels.
; PLAN: r0=132(x), r1=127(y), r2=97(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 127
LDI r2, 97
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
