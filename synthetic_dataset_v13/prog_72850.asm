; DESCRIPTION: Composite: Renders a yellow disk with center (130, 51) and radius 34 then Renders a cyan box of size 95x12 starting at (124, 86).
; PLAN: r0=130(x), r1=51(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x), r6=86(y), r7=95(width), r8=12(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 130
LDI r1, 51
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 86
LDI r7, 95
LDI r8, 12
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
