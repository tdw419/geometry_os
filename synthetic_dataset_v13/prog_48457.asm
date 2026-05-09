; DESCRIPTION: Composite: Sets a single black pixel at (25, 44) then Renders a red box of size 96x38 starting at (248, 33).
; PLAN: r0=25(x), r1=44(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=248(x), r6=33(y), r7=96(width), r8=38(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 25
LDI r1, 44
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 248
LDI r6, 33
LDI r7, 96
LDI r8, 38
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
