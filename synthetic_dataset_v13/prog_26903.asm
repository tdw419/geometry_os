; DESCRIPTION: Places a black 74x90 rectangle at position (110, 162).
; PLAN: r0=110(x), r1=162(y), r2=74(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 162
LDI r2, 74
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
