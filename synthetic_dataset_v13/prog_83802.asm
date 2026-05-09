; DESCRIPTION: Creates a red rectangular region at (290, 175) spanning 120 by 11 pixels.
; PLAN: r0=290(x), r1=175(y), r2=120(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 175
LDI r2, 120
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
