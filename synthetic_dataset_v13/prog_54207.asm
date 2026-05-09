; DESCRIPTION: Renders a yellow box of size 98x66 starting at (267, 84).
; PLAN: r0=267(x), r1=84(y), r2=98(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 84
LDI r2, 98
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
