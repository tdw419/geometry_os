; DESCRIPTION: Renders a yellow box of size 103x84 starting at (277, 139).
; PLAN: r0=277(x), r1=139(y), r2=103(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 139
LDI r2, 103
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
