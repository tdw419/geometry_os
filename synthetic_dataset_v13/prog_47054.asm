; DESCRIPTION: Renders a yellow box of size 113x12 starting at (296, 169).
; PLAN: r0=296(x), r1=169(y), r2=113(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 169
LDI r2, 113
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
