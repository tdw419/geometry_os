; DESCRIPTION: Places a blue 85x46 rectangle at position (100, 162).
; PLAN: r0=100(x), r1=162(y), r2=85(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 162
LDI r2, 85
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
