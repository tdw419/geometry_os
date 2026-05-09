; DESCRIPTION: Places a orange 21x81 rectangle at position (443, 66).
; PLAN: r0=443(x), r1=66(y), r2=21(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 66
LDI r2, 21
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
