; DESCRIPTION: Creates a magenta rectangular region at (107, 146) spanning 39 by 35 pixels.
; PLAN: r0=107(x), r1=146(y), r2=39(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 146
LDI r2, 39
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
