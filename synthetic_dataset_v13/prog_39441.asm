; DESCRIPTION: Places a yellow 26x30 rectangle at position (342, 35).
; PLAN: r0=342(x), r1=35(y), r2=26(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 35
LDI r2, 26
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
