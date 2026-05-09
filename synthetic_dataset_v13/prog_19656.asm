; DESCRIPTION: Renders a black box of size 38x104 starting at (391, 75).
; PLAN: r0=391(x), r1=75(y), r2=38(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 75
LDI r2, 38
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
