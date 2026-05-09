; DESCRIPTION: Renders a yellow box of size 50x45 starting at (81, 113).
; PLAN: r0=81(x), r1=113(y), r2=50(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 113
LDI r2, 50
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
