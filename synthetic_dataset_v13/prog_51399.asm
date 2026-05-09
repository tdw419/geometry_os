; DESCRIPTION: Places a cyan 83x17 rectangle at position (41, 205).
; PLAN: r0=41(x), r1=205(y), r2=83(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 205
LDI r2, 83
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
