; DESCRIPTION: Renders a white box of size 104x17 starting at (269, 214).
; PLAN: r0=269(x), r1=214(y), r2=104(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 214
LDI r2, 104
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
