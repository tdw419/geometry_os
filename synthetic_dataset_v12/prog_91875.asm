; DESCRIPTION: Places a black 23x20 rectangle at position (73, 229).
; PLAN: r0=73(x), r1=229(y), r2=23(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 229
LDI r2, 23
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
