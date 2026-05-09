; DESCRIPTION: Places a white 70x118 rectangle at position (395, 117).
; PLAN: r0=395(x), r1=117(y), r2=70(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 117
LDI r2, 70
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
