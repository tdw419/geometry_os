; DESCRIPTION: Renders a yellow box of size 24x93 starting at (164, 47).
; PLAN: r0=164(x), r1=47(y), r2=24(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 47
LDI r2, 24
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
