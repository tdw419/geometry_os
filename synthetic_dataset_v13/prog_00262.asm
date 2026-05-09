; DESCRIPTION: Creates a blue rectangular region at (346, 24) spanning 90 by 51 pixels.
; PLAN: r0=346(x), r1=24(y), r2=90(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 24
LDI r2, 90
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
