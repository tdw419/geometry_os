; DESCRIPTION: Renders a yellow box of size 82x99 starting at (160, 86).
; PLAN: r0=160(x), r1=86(y), r2=82(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 86
LDI r2, 82
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
