; DESCRIPTION: Places a white 85x52 rectangle at position (313, 183).
; PLAN: r0=313(x), r1=183(y), r2=85(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 183
LDI r2, 85
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
