; DESCRIPTION: Renders a yellow box of size 72x105 starting at (131, 0).
; PLAN: r0=131(x), r1=0(y), r2=72(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 0
LDI r2, 72
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
