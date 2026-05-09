; DESCRIPTION: Renders a yellow box of size 57x11 starting at (208, 170).
; PLAN: r0=208(x), r1=170(y), r2=57(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 170
LDI r2, 57
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
