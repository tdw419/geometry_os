; DESCRIPTION: Renders a yellow box of size 113x52 starting at (38, 50).
; PLAN: r0=38(x), r1=50(y), r2=113(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 50
LDI r2, 113
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
