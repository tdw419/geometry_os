; DESCRIPTION: Creates a red rectangular region at (27, 7) spanning 115 by 56 pixels.
; PLAN: r0=27(x), r1=7(y), r2=115(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 7
LDI r2, 115
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
