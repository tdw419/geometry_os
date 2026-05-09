; DESCRIPTION: Composite: Places a cyan dot at position (64, 30) then Draws a blue line from (164, 216) to (424, 148).
; PLAN: r0=64(x), r1=30(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=164(x1), r6=216(y1), r7=424(x2), r8=148(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 64
LDI r1, 30
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 164
LDI r6, 216
LDI r7, 424
LDI r8, 148
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
