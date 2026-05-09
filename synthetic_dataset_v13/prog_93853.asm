; DESCRIPTION: Creates a red rectangular region at (172, 69) spanning 51 by 94 pixels.
; PLAN: r0=172(x), r1=69(y), r2=51(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 69
LDI r2, 51
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
