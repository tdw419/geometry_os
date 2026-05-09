; DESCRIPTION: Composite: Sets a single green pixel at (253, 95) then Renders a red box of size 10x80 starting at (419, 29).
; PLAN: r0=253(x), r1=95(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=419(x), r6=29(y), r7=10(width), r8=80(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 95
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 419
LDI r6, 29
LDI r7, 10
LDI r8, 80
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
