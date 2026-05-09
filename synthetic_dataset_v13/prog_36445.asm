; DESCRIPTION: Composite: Renders a cyan disk with center (89, 107) and radius 47 then Renders a yellow box of size 67x23 starting at (404, 212).
; PLAN: r0=89(x), r1=107(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=404(x), r6=212(y), r7=67(width), r8=23(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 89
LDI r1, 107
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 404
LDI r6, 212
LDI r7, 67
LDI r8, 23
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
