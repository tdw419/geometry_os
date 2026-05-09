; DESCRIPTION: Renders a yellow box of size 34x109 starting at (177, 72).
; PLAN: r0=177(x), r1=72(y), r2=34(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 72
LDI r2, 34
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
