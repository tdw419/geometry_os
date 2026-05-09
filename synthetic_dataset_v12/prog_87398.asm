; DESCRIPTION: Places a magenta 118x119 rectangle at position (256, 107).
; PLAN: r0=256(x), r1=107(y), r2=118(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 107
LDI r2, 118
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
