; DESCRIPTION: Renders a yellow box of size 61x76 starting at (428, 144).
; PLAN: r0=428(x), r1=144(y), r2=61(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 144
LDI r2, 61
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
