; DESCRIPTION: Creates a red rectangular region at (461, 50) spanning 25 by 117 pixels.
; PLAN: r0=461(x), r1=50(y), r2=25(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 50
LDI r2, 25
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
