; DESCRIPTION: Places a red 13x21 rectangle at position (14, 155).
; PLAN: r0=14(x), r1=155(y), r2=13(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 155
LDI r2, 13
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
