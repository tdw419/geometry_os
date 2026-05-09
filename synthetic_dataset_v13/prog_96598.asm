; DESCRIPTION: Creates a blue rectangular region at (68, 166) spanning 14 by 75 pixels.
; PLAN: r0=68(x), r1=166(y), r2=14(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 166
LDI r2, 14
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
