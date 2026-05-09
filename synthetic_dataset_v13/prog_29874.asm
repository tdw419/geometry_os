; DESCRIPTION: Places a yellow 40x104 rectangle at position (95, 130).
; PLAN: r0=95(x), r1=130(y), r2=40(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 130
LDI r2, 40
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
