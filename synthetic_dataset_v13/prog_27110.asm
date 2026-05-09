; DESCRIPTION: Composite: Places a cyan line segment connecting (394, 101) to (404, 127) then Places a green circle of radius 38 at center (144, 114).
; PLAN: r0=394(x1), r1=101(y1), r2=404(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=144(x), r6=114(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 394
LDI r1, 101
LDI r2, 404
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 114
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
