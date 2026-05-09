; DESCRIPTION: Composite: Sets a single purple pixel at (385, 142) then Renders a red box of size 75x40 starting at (214, 131).
; PLAN: r0=385(x), r1=142(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=214(x), r6=131(y), r7=75(width), r8=40(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 385
LDI r1, 142
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 214
LDI r6, 131
LDI r7, 75
LDI r8, 40
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
