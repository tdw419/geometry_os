; DESCRIPTION: Places a yellow 85x22 rectangle at position (135, 148).
; PLAN: r0=135(x), r1=148(y), r2=85(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 148
LDI r2, 85
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
