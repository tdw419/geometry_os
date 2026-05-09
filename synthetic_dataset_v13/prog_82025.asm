; DESCRIPTION: Places a yellow 26x105 rectangle at position (443, 17).
; PLAN: r0=443(x), r1=17(y), r2=26(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 17
LDI r2, 26
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
