; DESCRIPTION: Places a red 23x38 rectangle at position (125, 85).
; PLAN: r0=125(x), r1=85(y), r2=23(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 85
LDI r2, 23
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
