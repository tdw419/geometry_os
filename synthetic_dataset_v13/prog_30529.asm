; DESCRIPTION: Places a blue 76x51 rectangle at position (288, 54).
; PLAN: r0=288(x), r1=54(y), r2=76(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 54
LDI r2, 76
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
