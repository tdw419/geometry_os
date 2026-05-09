; DESCRIPTION: Renders a yellow box of size 18x33 starting at (24, 86).
; PLAN: r0=24(x), r1=86(y), r2=18(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 86
LDI r2, 18
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
