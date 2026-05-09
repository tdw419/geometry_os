; DESCRIPTION: Creates a red rectangular region at (101, 206) spanning 73 by 22 pixels.
; PLAN: r0=101(x), r1=206(y), r2=73(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 206
LDI r2, 73
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
