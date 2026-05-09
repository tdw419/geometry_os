; DESCRIPTION: Composite: Places a green dot at position (312, 232) then Draws a cyan line from (69, 236) to (22, 16).
; PLAN: r0=312(x), r1=232(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=69(x1), r6=236(y1), r7=22(x2), r8=16(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 312
LDI r1, 232
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 69
LDI r6, 236
LDI r7, 22
LDI r8, 16
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
