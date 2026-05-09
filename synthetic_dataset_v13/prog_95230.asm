; DESCRIPTION: Places a blue 29x41 rectangle at position (39, 51).
; PLAN: r0=39(x), r1=51(y), r2=29(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 51
LDI r2, 29
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
