; DESCRIPTION: Places a red 70x117 rectangle at position (431, 25).
; PLAN: r0=431(x), r1=25(y), r2=70(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 25
LDI r2, 70
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
