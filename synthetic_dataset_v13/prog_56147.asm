; DESCRIPTION: Creates a blue rectangular region at (428, 98) spanning 45 by 51 pixels.
; PLAN: r0=428(x), r1=98(y), r2=45(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 98
LDI r2, 45
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
