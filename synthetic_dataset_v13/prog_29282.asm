; DESCRIPTION: Renders a yellow box of size 61x57 starting at (439, 88).
; PLAN: r0=439(x), r1=88(y), r2=61(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 88
LDI r2, 61
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
