; DESCRIPTION: Composite: Places a purple line segment connecting (328, 122) to (240, 248) then Draws a cyan circle centered at (345, 111) with radius 50.
; PLAN: r0=328(x1), r1=122(y1), r2=240(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=345(x), r6=111(y), r7=50(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 328
LDI r1, 122
LDI r2, 240
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 111
LDI r7, 50
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
