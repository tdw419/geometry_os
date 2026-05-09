; DESCRIPTION: Places a red 85x55 rectangle at position (87, 7).
; PLAN: r0=87(x), r1=7(y), r2=85(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 7
LDI r2, 85
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
