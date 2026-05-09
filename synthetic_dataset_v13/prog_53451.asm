; DESCRIPTION: Renders a yellow box of size 14x23 starting at (480, 39).
; PLAN: r0=480(x), r1=39(y), r2=14(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 39
LDI r2, 14
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
