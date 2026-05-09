; DESCRIPTION: Renders a green box of size 10x112 starting at (38, 108).
; PLAN: r0=38(x), r1=108(y), r2=10(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 108
LDI r2, 10
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
