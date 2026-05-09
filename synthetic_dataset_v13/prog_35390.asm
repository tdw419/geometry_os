; DESCRIPTION: Creates a blue rectangular region at (74, 166) spanning 83 by 40 pixels.
; PLAN: r0=74(x), r1=166(y), r2=83(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 166
LDI r2, 83
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
