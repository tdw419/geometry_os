; DESCRIPTION: Creates a red rectangular region at (52, 89) spanning 76 by 104 pixels.
; PLAN: r0=52(x), r1=89(y), r2=76(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 89
LDI r2, 76
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
