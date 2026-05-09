; DESCRIPTION: Renders a yellow box of size 89x56 starting at (293, 13).
; PLAN: r0=293(x), r1=13(y), r2=89(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 13
LDI r2, 89
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
