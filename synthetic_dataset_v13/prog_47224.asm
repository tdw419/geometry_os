; DESCRIPTION: Creates a red rectangular region at (214, 109) spanning 104 by 89 pixels.
; PLAN: r0=214(x), r1=109(y), r2=104(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 109
LDI r2, 104
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
