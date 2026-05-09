; DESCRIPTION: Places a white 24x51 rectangle at position (209, 138).
; PLAN: r0=209(x), r1=138(y), r2=24(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 138
LDI r2, 24
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
