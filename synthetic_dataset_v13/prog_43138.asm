; DESCRIPTION: Places a white 14x85 rectangle at position (103, 84).
; PLAN: r0=103(x), r1=84(y), r2=14(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 84
LDI r2, 14
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
