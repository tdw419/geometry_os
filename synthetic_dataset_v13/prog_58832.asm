; DESCRIPTION: Renders a yellow box of size 94x65 starting at (340, 0).
; PLAN: r0=340(x), r1=0(y), r2=94(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 0
LDI r2, 94
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
