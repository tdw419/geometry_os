; DESCRIPTION: Places a black 16x80 rectangle at position (40, 18).
; PLAN: r0=40(x), r1=18(y), r2=16(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 18
LDI r2, 16
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
