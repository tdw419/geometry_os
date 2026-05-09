; DESCRIPTION: Renders a green box of size 28x40 starting at (296, 73).
; PLAN: r0=296(x), r1=73(y), r2=28(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 73
LDI r2, 28
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
