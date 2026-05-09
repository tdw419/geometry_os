; DESCRIPTION: Renders a yellow box of size 118x50 starting at (223, 30).
; PLAN: r0=223(x), r1=30(y), r2=118(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 30
LDI r2, 118
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
