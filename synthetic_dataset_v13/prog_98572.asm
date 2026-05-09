; DESCRIPTION: Composite: Renders a cyan disk with center (251, 173) and radius 39 then Renders a yellow box of size 80x109 starting at (292, 96).
; PLAN: r0=251(x), r1=173(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=292(x), r6=96(y), r7=80(width), r8=109(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 173
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 292
LDI r6, 96
LDI r7, 80
LDI r8, 109
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
