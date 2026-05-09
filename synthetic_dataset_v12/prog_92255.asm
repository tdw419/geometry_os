; DESCRIPTION: Places a white 14x40 rectangle at position (61, 112).
; PLAN: r0=61(x), r1=112(y), r2=14(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 112
LDI r2, 14
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
