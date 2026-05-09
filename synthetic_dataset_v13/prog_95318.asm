; DESCRIPTION: Composite: Draws a red line from (319, 196) to (138, 50) then Places a green circle of radius 25 at center (410, 198).
; PLAN: r0=319(x1), r1=196(y1), r2=138(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=198(y), r7=25(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 319
LDI r1, 196
LDI r2, 138
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 198
LDI r7, 25
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
