; DESCRIPTION: Renders a green box of size 28x84 starting at (403, 29).
; PLAN: r0=403(x), r1=29(y), r2=28(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 29
LDI r2, 28
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
