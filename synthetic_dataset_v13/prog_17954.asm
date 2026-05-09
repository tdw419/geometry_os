; DESCRIPTION: Renders a yellow box of size 74x62 starting at (404, 125).
; PLAN: r0=404(x), r1=125(y), r2=74(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 125
LDI r2, 74
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
