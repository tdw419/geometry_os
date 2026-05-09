; DESCRIPTION: Composite: Places a green dot at position (258, 135) then Draws a magenta line from (25, 179) to (121, 222).
; PLAN: r0=258(x), r1=135(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=25(x1), r6=179(y1), r7=121(x2), r8=222(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 258
LDI r1, 135
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 25
LDI r6, 179
LDI r7, 121
LDI r8, 222
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
