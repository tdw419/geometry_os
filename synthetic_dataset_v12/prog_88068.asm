; DESCRIPTION: Composite: Renders a orange disk with center (269, 41) and radius 29 then Renders a yellow box of size 18x87 starting at (419, 168).
; PLAN: r0=269(x), r1=41(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=419(x), r6=168(y), r7=18(width), r8=87(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 41
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 419
LDI r6, 168
LDI r7, 18
LDI r8, 87
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
