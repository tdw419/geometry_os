; DESCRIPTION: Creates a blue rectangular region at (213, 43) spanning 65 by 25 pixels.
; PLAN: r0=213(x), r1=43(y), r2=65(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 43
LDI r2, 65
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
