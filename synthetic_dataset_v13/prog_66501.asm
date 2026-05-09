; DESCRIPTION: Renders a yellow box of size 114x45 starting at (157, 86).
; PLAN: r0=157(x), r1=86(y), r2=114(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 86
LDI r2, 114
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
