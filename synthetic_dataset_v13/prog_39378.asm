; DESCRIPTION: Renders a white box of size 104x86 starting at (334, 18).
; PLAN: r0=334(x), r1=18(y), r2=104(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 18
LDI r2, 104
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
