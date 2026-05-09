; DESCRIPTION: Composite: Draws a cyan line from (192, 178) to (34, 122) then Places a red circle of radius 20 at center (307, 99).
; PLAN: r0=192(x1), r1=178(y1), r2=34(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=99(y), r7=20(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 192
LDI r1, 178
LDI r2, 34
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 99
LDI r7, 20
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
