; DESCRIPTION: Creates a purple rectangular region at (285, 174) spanning 12 by 10 pixels.
; PLAN: r0=285(x), r1=174(y), r2=12(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 174
LDI r2, 12
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
