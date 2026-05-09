; DESCRIPTION: Composite: Places a green line segment connecting (202, 222) to (450, 84) then Renders a yellow box of size 89x39 starting at (310, 122).
; PLAN: r0=202(x1), r1=222(y1), r2=450(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=310(x), r6=122(y), r7=89(width), r8=39(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 202
LDI r1, 222
LDI r2, 450
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 122
LDI r7, 89
LDI r8, 39
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
