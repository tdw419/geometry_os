; DESCRIPTION: Creates a red rectangular region at (423, 148) spanning 50 by 68 pixels.
; PLAN: r0=423(x), r1=148(y), r2=50(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 148
LDI r2, 50
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
