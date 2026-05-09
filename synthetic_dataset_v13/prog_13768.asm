; DESCRIPTION: Renders a yellow box of size 116x37 starting at (21, 120).
; PLAN: r0=21(x), r1=120(y), r2=116(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 120
LDI r2, 116
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
