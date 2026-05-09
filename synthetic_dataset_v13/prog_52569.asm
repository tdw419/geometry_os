; DESCRIPTION: Renders a yellow box of size 117x21 starting at (330, 128).
; PLAN: r0=330(x), r1=128(y), r2=117(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 128
LDI r2, 117
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
