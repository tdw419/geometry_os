; DESCRIPTION: Creates a red rectangular region at (287, 33) spanning 45 by 20 pixels.
; PLAN: r0=287(x), r1=33(y), r2=45(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 33
LDI r2, 45
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
