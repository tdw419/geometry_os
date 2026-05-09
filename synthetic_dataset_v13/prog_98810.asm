; DESCRIPTION: Renders a white box of size 39x11 starting at (256, 20).
; PLAN: r0=256(x), r1=20(y), r2=39(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 20
LDI r2, 39
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
