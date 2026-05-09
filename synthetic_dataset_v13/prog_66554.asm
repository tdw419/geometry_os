; DESCRIPTION: Places a yellow 98x41 rectangle at position (132, 17).
; PLAN: r0=132(x), r1=17(y), r2=98(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 17
LDI r2, 98
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
