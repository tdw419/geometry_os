; DESCRIPTION: Composite: Places a cyan circle of radius 53 at center (413, 133) then Draws a magenta line from (220, 201) to (238, 242).
; PLAN: r0=413(x), r1=133(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=220(x1), r6=201(y1), r7=238(x2), r8=242(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 413
LDI r1, 133
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 220
LDI r6, 201
LDI r7, 238
LDI r8, 242
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
