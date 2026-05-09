; DESCRIPTION: Creates a blue rectangular region at (285, 114) spanning 39 by 10 pixels.
; PLAN: r0=285(x), r1=114(y), r2=39(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 114
LDI r2, 39
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
