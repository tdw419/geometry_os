; DESCRIPTION: Composite: Renders a yellow disk with center (404, 94) and radius 80 then Renders a cyan box of size 100x24 starting at (298, 191).
; PLAN: r0=404(x), r1=94(y), r2=80(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=298(x), r6=191(y), r7=100(width), r8=24(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 404
LDI r1, 94
LDI r2, 80
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 298
LDI r6, 191
LDI r7, 100
LDI r8, 24
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
