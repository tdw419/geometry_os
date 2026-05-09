; DESCRIPTION: Renders a yellow box of size 86x91 starting at (178, 20).
; PLAN: r0=178(x), r1=20(y), r2=86(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 20
LDI r2, 86
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
