; DESCRIPTION: Composite: Sets a single purple pixel at (61, 95) then Renders a red line between points (152, 224) and (291, 108).
; PLAN: r0=61(x), r1=95(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=152(x1), r6=224(y1), r7=291(x2), r8=108(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 95
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 152
LDI r6, 224
LDI r7, 291
LDI r8, 108
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
