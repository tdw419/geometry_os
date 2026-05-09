; DESCRIPTION: Renders a yellow box of size 119x50 starting at (325, 113).
; PLAN: r0=325(x), r1=113(y), r2=119(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 113
LDI r2, 119
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
