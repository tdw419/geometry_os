; DESCRIPTION: Places a yellow 29x17 rectangle at position (122, 172).
; PLAN: r0=122(x), r1=172(y), r2=29(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 172
LDI r2, 29
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
