; DESCRIPTION: Creates a blue rectangular region at (433, 199) spanning 61 by 27 pixels.
; PLAN: r0=433(x), r1=199(y), r2=61(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 199
LDI r2, 61
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
