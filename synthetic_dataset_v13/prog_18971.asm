; DESCRIPTION: Places a black 17x54 rectangle at position (297, 14).
; PLAN: r0=297(x), r1=14(y), r2=17(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 14
LDI r2, 17
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
