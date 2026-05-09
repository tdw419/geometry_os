; DESCRIPTION: Renders a yellow box of size 21x20 starting at (273, 4).
; PLAN: r0=273(x), r1=4(y), r2=21(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 4
LDI r2, 21
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
