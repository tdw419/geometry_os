; DESCRIPTION: Renders a green box of size 104x104 starting at (269, 119).
; PLAN: r0=269(x), r1=119(y), r2=104(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 119
LDI r2, 104
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
