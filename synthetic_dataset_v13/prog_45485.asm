; DESCRIPTION: Renders a yellow box of size 61x109 starting at (237, 10).
; PLAN: r0=237(x), r1=10(y), r2=61(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 10
LDI r2, 61
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
