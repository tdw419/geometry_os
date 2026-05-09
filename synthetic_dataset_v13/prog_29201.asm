; DESCRIPTION: Creates a white rectangular region at (236, 177) spanning 88 by 10 pixels.
; PLAN: r0=236(x), r1=177(y), r2=88(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 177
LDI r2, 88
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
