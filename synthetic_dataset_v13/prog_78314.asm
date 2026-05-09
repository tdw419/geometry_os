; DESCRIPTION: Places a blue 82x51 rectangle at position (28, 172).
; PLAN: r0=28(x), r1=172(y), r2=82(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 172
LDI r2, 82
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
