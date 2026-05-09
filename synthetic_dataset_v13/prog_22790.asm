; DESCRIPTION: Renders a yellow box of size 43x91 starting at (368, 37).
; PLAN: r0=368(x), r1=37(y), r2=43(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 37
LDI r2, 43
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
