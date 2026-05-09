; DESCRIPTION: Places a red 70x114 rectangle at position (442, 80).
; PLAN: r0=442(x), r1=80(y), r2=70(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 80
LDI r2, 70
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
