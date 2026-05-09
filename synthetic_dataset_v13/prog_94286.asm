; DESCRIPTION: Creates a blue rectangular region at (349, 197) spanning 107 by 28 pixels.
; PLAN: r0=349(x), r1=197(y), r2=107(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 197
LDI r2, 107
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
