; DESCRIPTION: Places a red 85x81 rectangle at position (13, 55).
; PLAN: r0=13(x), r1=55(y), r2=85(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 55
LDI r2, 85
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
