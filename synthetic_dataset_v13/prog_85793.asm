; DESCRIPTION: Places a red 99x94 rectangle at position (209, 35).
; PLAN: r0=209(x), r1=35(y), r2=99(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 35
LDI r2, 99
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
