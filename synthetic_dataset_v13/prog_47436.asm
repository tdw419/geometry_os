; DESCRIPTION: Composite: Renders a yellow line between points (361, 168) and (308, 238) then Places a blue dot at position (103, 31).
; PLAN: r0=361(x1), r1=168(y1), r2=308(x2), r3=238(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=31(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 361
LDI r1, 168
LDI r2, 308
LDI r3, 238
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 31
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
