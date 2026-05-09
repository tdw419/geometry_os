; DESCRIPTION: Creates a blue rectangular region at (330, 14) spanning 107 by 93 pixels.
; PLAN: r0=330(x), r1=14(y), r2=107(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 14
LDI r2, 107
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
