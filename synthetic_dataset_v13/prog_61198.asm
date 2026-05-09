; DESCRIPTION: Places a orange 80x15 rectangle at position (40, 127).
; PLAN: r0=40(x), r1=127(y), r2=80(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 127
LDI r2, 80
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
