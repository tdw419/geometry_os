; DESCRIPTION: Places a white 51x19 rectangle at position (209, 184).
; PLAN: r0=209(x), r1=184(y), r2=51(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 184
LDI r2, 51
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
