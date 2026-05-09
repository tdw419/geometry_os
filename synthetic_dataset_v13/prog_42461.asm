; DESCRIPTION: Creates a red rectangular region at (207, 50) spanning 116 by 71 pixels.
; PLAN: r0=207(x), r1=50(y), r2=116(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 50
LDI r2, 116
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
