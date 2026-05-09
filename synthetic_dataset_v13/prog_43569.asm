; DESCRIPTION: Renders a yellow box of size 96x32 starting at (113, 159).
; PLAN: r0=113(x), r1=159(y), r2=96(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 159
LDI r2, 96
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
