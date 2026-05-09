; DESCRIPTION: Renders a yellow box of size 66x94 starting at (226, 27).
; PLAN: r0=226(x), r1=27(y), r2=66(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 27
LDI r2, 66
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
