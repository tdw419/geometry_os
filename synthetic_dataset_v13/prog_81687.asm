; DESCRIPTION: Composite: Renders a blue line between points (419, 129) and (93, 210) then Places a red 101x46 rectangle at position (244, 183).
; PLAN: r0=419(x1), r1=129(y1), r2=93(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=183(y), r7=101(width), r8=46(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 129
LDI r2, 93
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 183
LDI r7, 101
LDI r8, 46
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
