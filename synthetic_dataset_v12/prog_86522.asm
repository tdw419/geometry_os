; DESCRIPTION: Composite: Sets a single black pixel at (505, 242) then Creates a black rectangular region at (187, 111) spanning 29 by 107 pixels.
; PLAN: r0=505(x), r1=242(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=187(x), r6=111(y), r7=29(width), r8=107(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 505
LDI r1, 242
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 187
LDI r6, 111
LDI r7, 29
LDI r8, 107
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
