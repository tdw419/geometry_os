; DESCRIPTION: Places a black 90x109 rectangle at position (196, 70).
; PLAN: r0=196(x), r1=70(y), r2=90(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 70
LDI r2, 90
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
