; DESCRIPTION: Places a white 54x51 rectangle at position (285, 121).
; PLAN: r0=285(x), r1=121(y), r2=54(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 121
LDI r2, 54
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
