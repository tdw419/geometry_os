; DESCRIPTION: Places a black 99x40 rectangle at position (378, 67).
; PLAN: r0=378(x), r1=67(y), r2=99(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 67
LDI r2, 99
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
