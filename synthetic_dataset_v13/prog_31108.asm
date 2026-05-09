; DESCRIPTION: Creates a blue rectangular region at (394, 51) spanning 45 by 86 pixels.
; PLAN: r0=394(x), r1=51(y), r2=45(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 51
LDI r2, 45
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
