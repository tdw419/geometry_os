; DESCRIPTION: Renders a yellow box of size 31x77 starting at (252, 119).
; PLAN: r0=252(x), r1=119(y), r2=31(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 119
LDI r2, 31
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
