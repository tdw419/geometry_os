; DESCRIPTION: Creates a red rectangular region at (342, 82) spanning 84 by 117 pixels.
; PLAN: r0=342(x), r1=82(y), r2=84(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 82
LDI r2, 84
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
