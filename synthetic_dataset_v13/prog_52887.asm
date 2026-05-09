; DESCRIPTION: Places a yellow 41x34 rectangle at position (70, 54).
; PLAN: r0=70(x), r1=54(y), r2=41(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 54
LDI r2, 41
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
