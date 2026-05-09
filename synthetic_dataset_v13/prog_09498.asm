; DESCRIPTION: Creates a magenta rectangular region at (175, 142) spanning 16 by 90 pixels.
; PLAN: r0=175(x), r1=142(y), r2=16(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 142
LDI r2, 16
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
