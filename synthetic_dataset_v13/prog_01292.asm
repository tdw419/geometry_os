; DESCRIPTION: Creates a blue rectangular region at (35, 195) spanning 29 by 27 pixels.
; PLAN: r0=35(x), r1=195(y), r2=29(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 195
LDI r2, 29
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
