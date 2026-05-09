; DESCRIPTION: Places a red 13x69 rectangle at position (176, 5).
; PLAN: r0=176(x), r1=5(y), r2=13(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 5
LDI r2, 13
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
