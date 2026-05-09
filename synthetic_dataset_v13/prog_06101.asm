; DESCRIPTION: Places a blue 89x91 rectangle at position (245, 99).
; PLAN: r0=245(x), r1=99(y), r2=89(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 99
LDI r2, 89
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
