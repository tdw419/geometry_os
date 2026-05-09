; DESCRIPTION: Creates a red rectangular region at (61, 57) spanning 117 by 120 pixels.
; PLAN: r0=61(x), r1=57(y), r2=117(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 57
LDI r2, 117
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
