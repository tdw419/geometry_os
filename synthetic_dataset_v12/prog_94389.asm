; DESCRIPTION: Places a white 51x119 rectangle at position (210, 62).
; PLAN: r0=210(x), r1=62(y), r2=51(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 62
LDI r2, 51
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
