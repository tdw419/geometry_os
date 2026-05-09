; DESCRIPTION: Creates a red rectangular region at (186, 75) spanning 10 by 37 pixels.
; PLAN: r0=186(x), r1=75(y), r2=10(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 75
LDI r2, 10
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
