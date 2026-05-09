; DESCRIPTION: Creates a red rectangular region at (200, 129) spanning 69 by 116 pixels.
; PLAN: r0=200(x), r1=129(y), r2=69(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 129
LDI r2, 69
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
