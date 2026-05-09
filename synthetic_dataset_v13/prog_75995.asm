; DESCRIPTION: Places a green 24x80 rectangle at position (145, 1).
; PLAN: r0=145(x), r1=1(y), r2=24(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 1
LDI r2, 24
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
