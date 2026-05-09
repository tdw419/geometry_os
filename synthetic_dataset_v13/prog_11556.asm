; DESCRIPTION: Places a blue 109x51 rectangle at position (276, 86).
; PLAN: r0=276(x), r1=86(y), r2=109(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 86
LDI r2, 109
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
