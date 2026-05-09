; DESCRIPTION: Composite: Renders a blue line between points (371, 12) and (34, 25) then Places a magenta 120x107 rectangle at position (216, 145).
; PLAN: r0=371(x1), r1=12(y1), r2=34(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=145(y), r7=120(width), r8=107(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 371
LDI r1, 12
LDI r2, 34
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 145
LDI r7, 120
LDI r8, 107
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
