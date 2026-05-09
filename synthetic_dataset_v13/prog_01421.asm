; DESCRIPTION: Places a orange 82x85 rectangle at position (12, 82).
; PLAN: r0=12(x), r1=82(y), r2=82(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 82
LDI r2, 82
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
