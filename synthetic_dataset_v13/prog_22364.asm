; DESCRIPTION: Renders a white box of size 45x104 starting at (248, 91).
; PLAN: r0=248(x), r1=91(y), r2=45(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 91
LDI r2, 45
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
