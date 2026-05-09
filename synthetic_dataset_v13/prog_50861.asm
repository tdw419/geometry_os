; DESCRIPTION: Places a orange 91x118 rectangle at position (206, 6).
; PLAN: r0=206(x), r1=6(y), r2=91(width), r3=118(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 6
LDI r2, 91
LDI r3, 118
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
