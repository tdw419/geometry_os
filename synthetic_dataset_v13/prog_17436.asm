; DESCRIPTION: Creates a red rectangular region at (340, 179) spanning 11 by 21 pixels.
; PLAN: r0=340(x), r1=179(y), r2=11(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 179
LDI r2, 11
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
