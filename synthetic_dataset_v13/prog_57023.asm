; DESCRIPTION: Creates a red rectangular region at (271, 3) spanning 72 by 25 pixels.
; PLAN: r0=271(x), r1=3(y), r2=72(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 3
LDI r2, 72
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
