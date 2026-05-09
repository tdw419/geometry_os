; DESCRIPTION: Renders a yellow box of size 94x10 starting at (269, 69).
; PLAN: r0=269(x), r1=69(y), r2=94(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 69
LDI r2, 94
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
