; DESCRIPTION: Creates a purple rectangular region at (189, 146) spanning 98 by 109 pixels.
; PLAN: r0=189(x), r1=146(y), r2=98(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 146
LDI r2, 98
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
