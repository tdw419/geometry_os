; DESCRIPTION: Places a blue 71x100 rectangle at position (117, 80).
; PLAN: r0=117(x), r1=80(y), r2=71(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 80
LDI r2, 71
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
