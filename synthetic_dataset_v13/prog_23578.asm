; DESCRIPTION: Creates a red rectangular region at (54, 206) spanning 112 by 34 pixels.
; PLAN: r0=54(x), r1=206(y), r2=112(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 206
LDI r2, 112
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
