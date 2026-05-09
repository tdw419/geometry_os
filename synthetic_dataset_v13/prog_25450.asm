; DESCRIPTION: Places a orange 10x50 rectangle at position (429, 14).
; PLAN: r0=429(x), r1=14(y), r2=10(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 14
LDI r2, 10
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
