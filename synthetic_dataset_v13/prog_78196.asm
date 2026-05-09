; DESCRIPTION: Composite: Renders a green line between points (25, 225) and (164, 25) then Places a blue 40x102 rectangle at position (303, 144).
; PLAN: r0=25(x1), r1=225(y1), r2=164(x2), r3=25(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=144(y), r7=40(width), r8=102(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 25
LDI r1, 225
LDI r2, 164
LDI r3, 25
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 144
LDI r7, 40
LDI r8, 102
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
