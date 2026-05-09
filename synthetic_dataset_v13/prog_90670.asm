; DESCRIPTION: Places a orange 110x50 rectangle at position (244, 167).
; PLAN: r0=244(x), r1=167(y), r2=110(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 167
LDI r2, 110
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
