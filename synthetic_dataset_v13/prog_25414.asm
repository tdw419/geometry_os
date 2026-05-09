; DESCRIPTION: Renders a yellow box of size 10x20 starting at (411, 91).
; PLAN: r0=411(x), r1=91(y), r2=10(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 91
LDI r2, 10
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
