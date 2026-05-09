; DESCRIPTION: Creates a purple rectangular region at (91, 126) spanning 92 by 109 pixels.
; PLAN: r0=91(x), r1=126(y), r2=92(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 126
LDI r2, 92
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
