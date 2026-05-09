; DESCRIPTION: Creates a red rectangular region at (244, 179) spanning 107 by 38 pixels.
; PLAN: r0=244(x), r1=179(y), r2=107(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 179
LDI r2, 107
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
