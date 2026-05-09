; DESCRIPTION: Places a yellow 47x41 rectangle at position (377, 39).
; PLAN: r0=377(x), r1=39(y), r2=47(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 39
LDI r2, 47
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
