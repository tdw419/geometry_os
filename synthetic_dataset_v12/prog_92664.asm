; DESCRIPTION: Places a white 61x85 rectangle at position (132, 19).
; PLAN: r0=132(x), r1=19(y), r2=61(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 19
LDI r2, 61
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
