; DESCRIPTION: Creates a magenta rectangular region at (264, 195) spanning 34 by 46 pixels.
; PLAN: r0=264(x), r1=195(y), r2=34(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 195
LDI r2, 34
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
