; DESCRIPTION: Renders a yellow box of size 98x86 starting at (110, 156).
; PLAN: r0=110(x), r1=156(y), r2=98(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 156
LDI r2, 98
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
