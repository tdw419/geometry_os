; DESCRIPTION: Renders a yellow box of size 50x31 starting at (36, 94).
; PLAN: r0=36(x), r1=94(y), r2=50(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 94
LDI r2, 50
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
