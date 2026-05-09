; DESCRIPTION: Composite: Renders a red line between points (19, 110) and (13, 168) then Places a blue 98x45 rectangle at position (304, 148).
; PLAN: r0=19(x1), r1=110(y1), r2=13(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=148(y), r7=98(width), r8=45(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 19
LDI r1, 110
LDI r2, 13
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 148
LDI r7, 98
LDI r8, 45
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
