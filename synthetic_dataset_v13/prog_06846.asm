; DESCRIPTION: Composite: Renders a cyan line between points (131, 168) and (456, 227) then Places a blue 40x91 rectangle at position (424, 110).
; PLAN: r0=131(x1), r1=168(y1), r2=456(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=424(x), r6=110(y), r7=40(width), r8=91(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 131
LDI r1, 168
LDI r2, 456
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 110
LDI r7, 40
LDI r8, 91
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
