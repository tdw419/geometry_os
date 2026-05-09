; DESCRIPTION: Places a red 48x119 rectangle at position (132, 80).
; PLAN: r0=132(x), r1=80(y), r2=48(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 80
LDI r2, 48
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
