; DESCRIPTION: Renders a yellow box of size 27x85 starting at (160, 94).
; PLAN: r0=160(x), r1=94(y), r2=27(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 94
LDI r2, 27
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
