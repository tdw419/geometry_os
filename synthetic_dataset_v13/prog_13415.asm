; DESCRIPTION: Creates a red rectangular region at (102, 96) spanning 50 by 50 pixels.
; PLAN: r0=102(x), r1=96(y), r2=50(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 96
LDI r2, 50
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
