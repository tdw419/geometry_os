; DESCRIPTION: Creates a red rectangular region at (113, 71) spanning 117 by 115 pixels.
; PLAN: r0=113(x), r1=71(y), r2=117(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 71
LDI r2, 117
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
