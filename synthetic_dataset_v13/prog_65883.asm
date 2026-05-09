; DESCRIPTION: Places a black 74x80 rectangle at position (385, 132).
; PLAN: r0=385(x), r1=132(y), r2=74(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 132
LDI r2, 74
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
