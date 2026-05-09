; DESCRIPTION: Renders a yellow box of size 48x62 starting at (61, 178).
; PLAN: r0=61(x), r1=178(y), r2=48(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 178
LDI r2, 48
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
