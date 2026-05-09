; DESCRIPTION: Composite: Places a yellow dot at position (58, 137) then Creates a yellow rectangular region at (120, 146) spanning 114 by 25 pixels.
; PLAN: r0=58(x), r1=137(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=120(x), r6=146(y), r7=114(width), r8=25(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 137
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 120
LDI r6, 146
LDI r7, 114
LDI r8, 25
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
