; DESCRIPTION: Creates a blue rectangular region at (215, 15) spanning 107 by 26 pixels.
; PLAN: r0=215(x), r1=15(y), r2=107(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 15
LDI r2, 107
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
