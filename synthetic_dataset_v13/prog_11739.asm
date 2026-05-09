; DESCRIPTION: Composite: Places a yellow dot at position (24, 121) then Draws a blue line from (154, 161) to (76, 181).
; PLAN: r0=24(x), r1=121(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=154(x1), r6=161(y1), r7=76(x2), r8=181(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 24
LDI r1, 121
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 154
LDI r6, 161
LDI r7, 76
LDI r8, 181
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
