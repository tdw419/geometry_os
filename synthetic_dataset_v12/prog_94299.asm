; DESCRIPTION: Places a red 87x103 rectangle at position (25, 120).
; PLAN: r0=25(x), r1=120(y), r2=87(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 120
LDI r2, 87
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
