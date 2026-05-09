; DESCRIPTION: Places a magenta 41x16 rectangle at position (395, 58).
; PLAN: r0=395(x), r1=58(y), r2=41(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 58
LDI r2, 41
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
