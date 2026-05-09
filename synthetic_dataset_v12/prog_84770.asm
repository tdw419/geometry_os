; DESCRIPTION: Creates a magenta rectangular region at (384, 97) spanning 107 by 65 pixels.
; PLAN: r0=384(x), r1=97(y), r2=107(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 97
LDI r2, 107
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
