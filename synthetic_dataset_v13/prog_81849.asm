; DESCRIPTION: Places a yellow 13x62 rectangle at position (281, 191).
; PLAN: r0=281(x), r1=191(y), r2=13(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 191
LDI r2, 13
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
