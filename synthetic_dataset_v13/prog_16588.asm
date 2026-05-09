; DESCRIPTION: Places a green 18x22 rectangle at position (145, 5).
; PLAN: r0=145(x), r1=5(y), r2=18(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 5
LDI r2, 18
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
