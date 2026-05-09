; DESCRIPTION: Renders a yellow box of size 90x81 starting at (320, 39).
; PLAN: r0=320(x), r1=39(y), r2=90(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 39
LDI r2, 90
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
