; DESCRIPTION: Creates a red rectangular region at (208, 47) spanning 116 by 45 pixels.
; PLAN: r0=208(x), r1=47(y), r2=116(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 47
LDI r2, 116
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
