; DESCRIPTION: Places a orange 20x103 rectangle at position (20, 126).
; PLAN: r0=20(x), r1=126(y), r2=20(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 126
LDI r2, 20
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
