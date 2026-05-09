; DESCRIPTION: Places a black 91x28 rectangle at position (160, 83).
; PLAN: r0=160(x), r1=83(y), r2=91(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 83
LDI r2, 91
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
