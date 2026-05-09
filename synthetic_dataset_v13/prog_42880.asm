; DESCRIPTION: Creates a blue rectangular region at (233, 27) spanning 79 by 79 pixels.
; PLAN: r0=233(x), r1=27(y), r2=79(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 27
LDI r2, 79
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
