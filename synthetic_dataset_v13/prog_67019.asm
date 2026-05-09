; DESCRIPTION: Renders a yellow box of size 25x86 starting at (89, 23).
; PLAN: r0=89(x), r1=23(y), r2=25(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 23
LDI r2, 25
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
