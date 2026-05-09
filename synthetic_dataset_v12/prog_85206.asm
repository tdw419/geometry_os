; DESCRIPTION: Creates a red rectangular region at (175, 201) spanning 11 by 50 pixels.
; PLAN: r0=175(x), r1=201(y), r2=11(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 201
LDI r2, 11
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
