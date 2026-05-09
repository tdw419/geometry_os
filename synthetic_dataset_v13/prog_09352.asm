; DESCRIPTION: Places a blue 40x51 rectangle at position (108, 107).
; PLAN: r0=108(x), r1=107(y), r2=40(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 107
LDI r2, 40
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
