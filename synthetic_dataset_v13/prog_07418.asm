; DESCRIPTION: Renders a white box of size 27x104 starting at (230, 77).
; PLAN: r0=230(x), r1=77(y), r2=27(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 77
LDI r2, 27
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
