; DESCRIPTION: Creates a red rectangular region at (182, 126) spanning 117 by 80 pixels.
; PLAN: r0=182(x), r1=126(y), r2=117(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 126
LDI r2, 117
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
