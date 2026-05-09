; DESCRIPTION: Composite: Places a red dot at position (92, 220) then Creates a white rectangular region at (90, 112) spanning 98 by 45 pixels.
; PLAN: r0=92(x), r1=220(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=90(x), r6=112(y), r7=98(width), r8=45(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 92
LDI r1, 220
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 90
LDI r6, 112
LDI r7, 98
LDI r8, 45
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
