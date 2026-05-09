; DESCRIPTION: Renders a yellow box of size 61x13 starting at (420, 17).
; PLAN: r0=420(x), r1=17(y), r2=61(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 17
LDI r2, 61
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
