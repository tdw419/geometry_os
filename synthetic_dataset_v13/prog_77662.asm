; DESCRIPTION: Creates a yellow rectangular region at (127, 80) spanning 97 by 82 pixels.
; PLAN: r0=127(x), r1=80(y), r2=97(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 80
LDI r2, 97
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
