; DESCRIPTION: Places a yellow 28x75 rectangle at position (130, 162).
; PLAN: r0=130(x), r1=162(y), r2=28(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 162
LDI r2, 28
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
