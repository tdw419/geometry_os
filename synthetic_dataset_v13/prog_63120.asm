; DESCRIPTION: Renders a yellow box of size 36x72 starting at (276, 8).
; PLAN: r0=276(x), r1=8(y), r2=36(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 8
LDI r2, 36
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
