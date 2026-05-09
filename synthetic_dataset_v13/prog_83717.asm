; DESCRIPTION: Composite: Places a red 33x40 rectangle at position (239, 170) then Renders a green line between points (359, 229) and (321, 230).
; PLAN: r0=239(x), r1=170(y), r2=33(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=359(x1), r6=229(y1), r7=321(x2), r8=230(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 170
LDI r2, 33
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 229
LDI r7, 321
LDI r8, 230
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
