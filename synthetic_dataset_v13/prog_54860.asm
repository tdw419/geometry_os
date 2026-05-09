; DESCRIPTION: Creates a red rectangular region at (356, 78) spanning 21 by 51 pixels.
; PLAN: r0=356(x), r1=78(y), r2=21(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 78
LDI r2, 21
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
