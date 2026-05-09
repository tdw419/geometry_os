; DESCRIPTION: Renders a yellow box of size 109x39 starting at (197, 72).
; PLAN: r0=197(x), r1=72(y), r2=109(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 72
LDI r2, 109
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
