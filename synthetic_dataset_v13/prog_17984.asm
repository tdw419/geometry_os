; DESCRIPTION: Places a orange 25x68 rectangle at position (130, 5).
; PLAN: r0=130(x), r1=5(y), r2=25(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 5
LDI r2, 25
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
