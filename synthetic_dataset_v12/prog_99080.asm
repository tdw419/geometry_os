; DESCRIPTION: Creates a red rectangular region at (264, 53) spanning 91 by 95 pixels.
; PLAN: r0=264(x), r1=53(y), r2=91(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 53
LDI r2, 91
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
