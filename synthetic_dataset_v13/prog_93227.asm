; DESCRIPTION: Renders a green box of size 33x104 starting at (177, 101).
; PLAN: r0=177(x), r1=101(y), r2=33(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 101
LDI r2, 33
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
