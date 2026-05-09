; DESCRIPTION: Creates a red rectangular region at (290, 143) spanning 11 by 94 pixels.
; PLAN: r0=290(x), r1=143(y), r2=11(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 143
LDI r2, 11
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
