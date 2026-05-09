; DESCRIPTION: Composite: Draws a black circle centered at (420, 84) with radius 25 then Draws a green line from (370, 29) to (479, 68).
; PLAN: r0=420(x), r1=84(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=370(x1), r6=29(y1), r7=479(x2), r8=68(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 420
LDI r1, 84
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 370
LDI r6, 29
LDI r7, 479
LDI r8, 68
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
