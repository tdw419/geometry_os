; DESCRIPTION: Renders a yellow box of size 42x91 starting at (438, 136).
; PLAN: r0=438(x), r1=136(y), r2=42(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 136
LDI r2, 42
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
