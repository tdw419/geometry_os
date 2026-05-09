; DESCRIPTION: Places a yellow 86x86 rectangle at position (101, 41).
; PLAN: r0=101(x), r1=41(y), r2=86(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 41
LDI r2, 86
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
