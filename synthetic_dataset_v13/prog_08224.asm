; DESCRIPTION: Renders a yellow box of size 63x27 starting at (261, 93).
; PLAN: r0=261(x), r1=93(y), r2=63(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 93
LDI r2, 63
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
