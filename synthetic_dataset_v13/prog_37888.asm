; DESCRIPTION: Places a black 63x91 rectangle at position (131, 152).
; PLAN: r0=131(x), r1=152(y), r2=63(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 152
LDI r2, 63
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
