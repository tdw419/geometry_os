; DESCRIPTION: Composite: Places a purple circle of radius 27 at center (330, 150) then Creates a red rectangular region at (119, 82) spanning 46 by 107 pixels.
; PLAN: r0=330(x), r1=150(y), r2=27(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=119(x), r6=82(y), r7=46(width), r8=107(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 330
LDI r1, 150
LDI r2, 27
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 119
LDI r6, 82
LDI r7, 46
LDI r8, 107
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
