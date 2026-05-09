; DESCRIPTION: Creates a red rectangular region at (271, 38) spanning 49 by 61 pixels.
; PLAN: r0=271(x), r1=38(y), r2=49(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 38
LDI r2, 49
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
