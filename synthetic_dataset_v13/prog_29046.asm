; DESCRIPTION: Places a black 105x54 rectangle at position (313, 117).
; PLAN: r0=313(x), r1=117(y), r2=105(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 117
LDI r2, 105
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
