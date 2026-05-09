; DESCRIPTION: Creates a blue rectangular region at (123, 126) spanning 19 by 107 pixels.
; PLAN: r0=123(x), r1=126(y), r2=19(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 126
LDI r2, 19
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
