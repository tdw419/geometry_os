; DESCRIPTION: Creates a white rectangular region at (393, 190) spanning 58 by 12 pixels.
; PLAN: r0=393(x), r1=190(y), r2=58(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 190
LDI r2, 58
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
