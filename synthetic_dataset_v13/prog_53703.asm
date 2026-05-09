; DESCRIPTION: Places a green 47x50 rectangle at position (58, 41).
; PLAN: r0=58(x), r1=41(y), r2=47(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 41
LDI r2, 47
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
