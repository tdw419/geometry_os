; DESCRIPTION: Places a orange 12x51 rectangle at position (366, 198).
; PLAN: r0=366(x), r1=198(y), r2=12(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 198
LDI r2, 12
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
