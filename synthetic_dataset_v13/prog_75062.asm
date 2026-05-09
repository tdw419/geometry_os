; DESCRIPTION: Places a white 51x36 rectangle at position (308, 30).
; PLAN: r0=308(x), r1=30(y), r2=51(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 30
LDI r2, 51
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
