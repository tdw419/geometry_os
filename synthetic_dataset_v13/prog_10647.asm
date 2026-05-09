; DESCRIPTION: Composite: Sets a single red pixel at (214, 223) then Renders a green box of size 37x20 starting at (329, 190).
; PLAN: r0=214(x), r1=223(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=329(x), r6=190(y), r7=37(width), r8=20(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 223
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 329
LDI r6, 190
LDI r7, 37
LDI r8, 20
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
