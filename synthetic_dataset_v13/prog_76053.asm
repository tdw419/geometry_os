; DESCRIPTION: Places a black 33x54 rectangle at position (2, 200).
; PLAN: r0=2(x), r1=200(y), r2=33(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 200
LDI r2, 33
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
