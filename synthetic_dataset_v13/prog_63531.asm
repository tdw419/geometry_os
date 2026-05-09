; DESCRIPTION: Composite: Places a blue 66x24 rectangle at position (65, 157) then Draws a blue line from (355, 24) to (4, 32).
; PLAN: r0=65(x), r1=157(y), r2=66(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x1), r6=24(y1), r7=4(x2), r8=32(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 65
LDI r1, 157
LDI r2, 66
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 24
LDI r7, 4
LDI r8, 32
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
