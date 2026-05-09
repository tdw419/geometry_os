; DESCRIPTION: Renders a green box of size 28x111 starting at (415, 35).
; PLAN: r0=415(x), r1=35(y), r2=28(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 35
LDI r2, 28
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
