; DESCRIPTION: Places a blue 48x100 rectangle at position (106, 99).
; PLAN: r0=106(x), r1=99(y), r2=48(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 99
LDI r2, 48
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
