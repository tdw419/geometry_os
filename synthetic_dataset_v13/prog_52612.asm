; DESCRIPTION: Creates a red rectangular region at (216, 177) spanning 95 by 69 pixels.
; PLAN: r0=216(x), r1=177(y), r2=95(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 177
LDI r2, 95
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
