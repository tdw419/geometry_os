; DESCRIPTION: Places a red 19x100 rectangle at position (80, 1).
; PLAN: r0=80(x), r1=1(y), r2=19(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 1
LDI r2, 19
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
