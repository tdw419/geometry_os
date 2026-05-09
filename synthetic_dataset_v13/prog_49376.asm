; DESCRIPTION: Places a black 31x29 rectangle at position (275, 127).
; PLAN: r0=275(x), r1=127(y), r2=31(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 127
LDI r2, 31
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
