; DESCRIPTION: Places a yellow 80x13 rectangle at position (281, 217).
; PLAN: r0=281(x), r1=217(y), r2=80(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 217
LDI r2, 80
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
