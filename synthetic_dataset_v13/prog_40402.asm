; DESCRIPTION: Places a orange 60x85 rectangle at position (386, 123).
; PLAN: r0=386(x), r1=123(y), r2=60(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 123
LDI r2, 60
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
