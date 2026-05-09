; DESCRIPTION: Places a purple 13x97 rectangle at position (27, 52).
; PLAN: r0=27(x), r1=52(y), r2=13(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 52
LDI r2, 13
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
