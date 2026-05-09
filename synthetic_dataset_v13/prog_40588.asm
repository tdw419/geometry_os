; DESCRIPTION: Places a orange 80x22 rectangle at position (106, 73).
; PLAN: r0=106(x), r1=73(y), r2=80(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 73
LDI r2, 80
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
