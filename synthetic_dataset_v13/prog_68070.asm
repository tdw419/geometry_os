; DESCRIPTION: Composite: Places a red circle of radius 30 at center (284, 35) then Renders a cyan line between points (152, 83) and (433, 111) then Sets a single cyan pixel at (6, 20).
; PLAN: r0=284(x), r1=35(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=152(x1), r6=83(y1), r7=433(x2), r8=111(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=6(x), r11=20(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 284
LDI r1, 35
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 152
LDI r6, 83
LDI r7, 433
LDI r8, 111
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 6
LDI r11, 20
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
