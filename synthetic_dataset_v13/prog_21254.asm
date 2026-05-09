; DESCRIPTION: Renders a yellow box of size 102x20 starting at (32, 89).
; PLAN: r0=32(x), r1=89(y), r2=102(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 89
LDI r2, 102
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
