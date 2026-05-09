; DESCRIPTION: Renders a yellow box of size 52x85 starting at (368, 135).
; PLAN: r0=368(x), r1=135(y), r2=52(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 135
LDI r2, 52
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
