; DESCRIPTION: Renders a black box of size 104x80 starting at (87, 119).
; PLAN: r0=87(x), r1=119(y), r2=104(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 119
LDI r2, 104
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
