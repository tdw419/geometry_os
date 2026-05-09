; DESCRIPTION: Composite: Sets a single green pixel at (271, 55) then Draws a magenta line from (69, 35) to (73, 196).
; PLAN: r0=271(x), r1=55(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=69(x1), r6=35(y1), r7=73(x2), r8=196(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 55
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 69
LDI r6, 35
LDI r7, 73
LDI r8, 196
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
