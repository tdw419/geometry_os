; DESCRIPTION: Renders a yellow box of size 17x86 starting at (180, 23).
; PLAN: r0=180(x), r1=23(y), r2=17(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 23
LDI r2, 17
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
