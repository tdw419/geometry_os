; DESCRIPTION: Renders a yellow box of size 100x57 starting at (365, 9).
; PLAN: r0=365(x), r1=9(y), r2=100(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 9
LDI r2, 100
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
