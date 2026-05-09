; DESCRIPTION: Places a white 109x85 rectangle at position (51, 95).
; PLAN: r0=51(x), r1=95(y), r2=109(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 95
LDI r2, 109
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
