; DESCRIPTION: Composite: Places a green line segment connecting (15, 111) to (104, 69) then Renders a cyan disk with center (215, 92) and radius 30.
; PLAN: r0=15(x1), r1=111(y1), r2=104(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=215(x), r6=92(y), r7=30(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 15
LDI r1, 111
LDI r2, 104
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 92
LDI r7, 30
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
