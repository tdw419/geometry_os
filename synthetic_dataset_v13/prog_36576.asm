; DESCRIPTION: Places a red 26x50 rectangle at position (402, 31).
; PLAN: r0=402(x), r1=31(y), r2=26(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 31
LDI r2, 26
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
