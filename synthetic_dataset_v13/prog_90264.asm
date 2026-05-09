; DESCRIPTION: Composite: Renders a cyan line between points (388, 247) and (65, 107) then Creates a black rectangular region at (218, 14) spanning 72 by 114 pixels.
; PLAN: r0=388(x1), r1=247(y1), r2=65(x2), r3=107(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=218(x), r6=14(y), r7=72(width), r8=114(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 388
LDI r1, 247
LDI r2, 65
LDI r3, 107
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 14
LDI r7, 72
LDI r8, 114
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
