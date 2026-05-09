; DESCRIPTION: Places a orange 74x66 rectangle at position (220, 13).
; PLAN: r0=220(x), r1=13(y), r2=74(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 13
LDI r2, 74
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
