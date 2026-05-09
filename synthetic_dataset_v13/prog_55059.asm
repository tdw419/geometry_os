; DESCRIPTION: Renders a yellow box of size 116x59 starting at (237, 120).
; PLAN: r0=237(x), r1=120(y), r2=116(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 120
LDI r2, 116
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
