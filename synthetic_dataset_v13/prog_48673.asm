; DESCRIPTION: Creates a blue rectangular region at (293, 51) spanning 99 by 63 pixels.
; PLAN: r0=293(x), r1=51(y), r2=99(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 51
LDI r2, 99
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
