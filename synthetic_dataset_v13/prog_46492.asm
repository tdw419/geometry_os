; DESCRIPTION: Creates a purple rectangular region at (285, 125) spanning 50 by 10 pixels.
; PLAN: r0=285(x), r1=125(y), r2=50(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 125
LDI r2, 50
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
