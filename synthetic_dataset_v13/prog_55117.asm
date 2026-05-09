; DESCRIPTION: Creates a red rectangular region at (363, 112) spanning 45 by 65 pixels.
; PLAN: r0=363(x), r1=112(y), r2=45(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 112
LDI r2, 45
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
