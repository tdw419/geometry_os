; DESCRIPTION: Places a green 26x110 rectangle at position (317, 41).
; PLAN: r0=317(x), r1=41(y), r2=26(width), r3=110(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 41
LDI r2, 26
LDI r3, 110
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
