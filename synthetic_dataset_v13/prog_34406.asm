; DESCRIPTION: Composite: Places a black dot at position (313, 200) then Creates a white rectangular region at (233, 92) spanning 120 by 29 pixels.
; PLAN: r0=313(x), r1=200(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=233(x), r6=92(y), r7=120(width), r8=29(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 200
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 233
LDI r6, 92
LDI r7, 120
LDI r8, 29
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
