; DESCRIPTION: Places a white 98x85 rectangle at position (6, 52).
; PLAN: r0=6(x), r1=52(y), r2=98(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 52
LDI r2, 98
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
