; DESCRIPTION: Places a black 52x91 rectangle at position (205, 8).
; PLAN: r0=205(x), r1=8(y), r2=52(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 8
LDI r2, 52
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
