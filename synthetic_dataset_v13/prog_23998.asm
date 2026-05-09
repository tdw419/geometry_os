; DESCRIPTION: Renders a yellow box of size 90x72 starting at (118, 128).
; PLAN: r0=118(x), r1=128(y), r2=90(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 128
LDI r2, 90
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
