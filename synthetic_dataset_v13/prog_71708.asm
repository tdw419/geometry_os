; DESCRIPTION: Renders a yellow box of size 48x71 starting at (308, 109).
; PLAN: r0=308(x), r1=109(y), r2=48(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 109
LDI r2, 48
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
