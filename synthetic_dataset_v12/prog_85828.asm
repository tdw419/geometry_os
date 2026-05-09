; DESCRIPTION: Places a yellow 91x72 rectangle at position (293, 137).
; PLAN: r0=293(x), r1=137(y), r2=91(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 137
LDI r2, 91
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
