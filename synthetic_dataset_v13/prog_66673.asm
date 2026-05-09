; DESCRIPTION: Renders a yellow box of size 95x96 starting at (308, 35).
; PLAN: r0=308(x), r1=35(y), r2=95(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 35
LDI r2, 95
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
