; DESCRIPTION: Renders a yellow box of size 38x65 starting at (48, 11).
; PLAN: r0=48(x), r1=11(y), r2=38(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 11
LDI r2, 38
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
