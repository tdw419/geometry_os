; DESCRIPTION: Places a blue 51x39 rectangle at position (38, 106).
; PLAN: r0=38(x), r1=106(y), r2=51(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 106
LDI r2, 51
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
