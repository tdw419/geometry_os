; DESCRIPTION: Renders a white box of size 23x11 starting at (368, 8).
; PLAN: r0=368(x), r1=8(y), r2=23(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 8
LDI r2, 23
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
