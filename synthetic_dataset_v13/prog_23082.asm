; DESCRIPTION: Renders a yellow box of size 52x53 starting at (320, 29).
; PLAN: r0=320(x), r1=29(y), r2=52(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 29
LDI r2, 52
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
