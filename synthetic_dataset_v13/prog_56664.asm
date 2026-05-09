; DESCRIPTION: Renders a yellow box of size 25x54 starting at (335, 8).
; PLAN: r0=335(x), r1=8(y), r2=25(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 8
LDI r2, 25
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
