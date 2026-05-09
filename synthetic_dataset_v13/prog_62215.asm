; DESCRIPTION: Renders a yellow box of size 68x91 starting at (168, 100).
; PLAN: r0=168(x), r1=100(y), r2=68(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 100
LDI r2, 68
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
