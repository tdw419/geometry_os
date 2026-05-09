; DESCRIPTION: Places a black 91x26 rectangle at position (92, 229).
; PLAN: r0=92(x), r1=229(y), r2=91(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 229
LDI r2, 91
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
