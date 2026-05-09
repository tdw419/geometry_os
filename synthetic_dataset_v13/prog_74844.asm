; DESCRIPTION: Creates a red rectangular region at (186, 120) spanning 96 by 54 pixels.
; PLAN: r0=186(x), r1=120(y), r2=96(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 120
LDI r2, 96
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
