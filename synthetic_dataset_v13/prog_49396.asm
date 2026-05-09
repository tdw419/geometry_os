; DESCRIPTION: Composite: Draws a magenta line from (507, 155) to (415, 139) then Places a green dot at position (14, 207).
; PLAN: r0=507(x1), r1=155(y1), r2=415(x2), r3=139(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=14(x), r6=207(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 507
LDI r1, 155
LDI r2, 415
LDI r3, 139
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 207
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
