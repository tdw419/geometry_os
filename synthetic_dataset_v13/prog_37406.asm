; DESCRIPTION: Composite: Creates a white circular shape at (323, 79) with radius 68 then Creates a purple rectangular region at (384, 133) spanning 82 by 98 pixels.
; PLAN: r0=323(x), r1=79(y), r2=68(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=384(x), r6=133(y), r7=82(width), r8=98(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 323
LDI r1, 79
LDI r2, 68
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 384
LDI r6, 133
LDI r7, 82
LDI r8, 98
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
