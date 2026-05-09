; DESCRIPTION: Places a white 12x85 rectangle at position (385, 15).
; PLAN: r0=385(x), r1=15(y), r2=12(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 15
LDI r2, 12
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
