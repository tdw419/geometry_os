; DESCRIPTION: Places a orange 32x91 rectangle at position (221, 99).
; PLAN: r0=221(x), r1=99(y), r2=32(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 99
LDI r2, 32
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
