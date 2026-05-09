; DESCRIPTION: Creates a red rectangular region at (356, 104) spanning 45 by 112 pixels.
; PLAN: r0=356(x), r1=104(y), r2=45(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 104
LDI r2, 45
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
