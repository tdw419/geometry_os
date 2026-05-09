; DESCRIPTION: Renders a yellow box of size 89x32 starting at (147, 21).
; PLAN: r0=147(x), r1=21(y), r2=89(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 21
LDI r2, 89
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
