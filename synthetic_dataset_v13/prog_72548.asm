; DESCRIPTION: Creates a red rectangular region at (297, 168) spanning 67 by 43 pixels.
; PLAN: r0=297(x), r1=168(y), r2=67(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 168
LDI r2, 67
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
