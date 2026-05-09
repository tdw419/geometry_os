; DESCRIPTION: Creates a white rectangular region at (116, 146) spanning 45 by 98 pixels.
; PLAN: r0=116(x), r1=146(y), r2=45(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 146
LDI r2, 45
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
