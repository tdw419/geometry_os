; DESCRIPTION: Renders a green box of size 108x91 starting at (267, 84).
; PLAN: r0=267(x), r1=84(y), r2=108(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 84
LDI r2, 108
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
