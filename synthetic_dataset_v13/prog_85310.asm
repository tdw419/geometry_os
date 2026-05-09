; DESCRIPTION: Renders a yellow box of size 117x80 starting at (112, 134).
; PLAN: r0=112(x), r1=134(y), r2=117(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 134
LDI r2, 117
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
