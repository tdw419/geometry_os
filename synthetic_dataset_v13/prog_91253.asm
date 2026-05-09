; DESCRIPTION: Renders a yellow box of size 65x80 starting at (130, 134).
; PLAN: r0=130(x), r1=134(y), r2=65(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 134
LDI r2, 65
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
