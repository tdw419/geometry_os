; DESCRIPTION: Renders a green box of size 28x72 starting at (240, 129).
; PLAN: r0=240(x), r1=129(y), r2=28(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 129
LDI r2, 28
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
