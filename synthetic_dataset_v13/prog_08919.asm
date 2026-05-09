; DESCRIPTION: Creates a blue rectangular region at (151, 167) spanning 107 by 48 pixels.
; PLAN: r0=151(x), r1=167(y), r2=107(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 167
LDI r2, 107
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
