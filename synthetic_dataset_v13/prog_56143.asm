; DESCRIPTION: Places a black 15x99 rectangle at position (207, 60).
; PLAN: r0=207(x), r1=60(y), r2=15(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 60
LDI r2, 15
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
