; DESCRIPTION: Places a black 117x11 rectangle at position (319, 50).
; PLAN: r0=319(x), r1=50(y), r2=117(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 50
LDI r2, 117
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
