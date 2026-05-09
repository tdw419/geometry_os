; DESCRIPTION: Places a magenta 65x41 rectangle at position (339, 54).
; PLAN: r0=339(x), r1=54(y), r2=65(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 54
LDI r2, 65
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
