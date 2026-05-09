; DESCRIPTION: Creates a magenta rectangular region at (177, 187) spanning 40 by 46 pixels.
; PLAN: r0=177(x), r1=187(y), r2=40(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 187
LDI r2, 40
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
