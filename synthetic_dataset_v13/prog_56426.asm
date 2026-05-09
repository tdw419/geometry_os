; DESCRIPTION: Places a black 117x20 rectangle at position (360, 138).
; PLAN: r0=360(x), r1=138(y), r2=117(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 138
LDI r2, 117
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
