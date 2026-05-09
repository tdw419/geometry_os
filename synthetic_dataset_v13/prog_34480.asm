; DESCRIPTION: Composite: Sets a single red pixel at (441, 78) then Renders a cyan box of size 88x115 starting at (400, 29).
; PLAN: r0=441(x), r1=78(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=400(x), r6=29(y), r7=88(width), r8=115(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 441
LDI r1, 78
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 400
LDI r6, 29
LDI r7, 88
LDI r8, 115
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
