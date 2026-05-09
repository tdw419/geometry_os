; DESCRIPTION: Composite: Places a purple dot at position (447, 68) then Draws a blue line from (327, 178) to (413, 154).
; PLAN: r0=447(x), r1=68(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=327(x1), r6=178(y1), r7=413(x2), r8=154(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 447
LDI r1, 68
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 327
LDI r6, 178
LDI r7, 413
LDI r8, 154
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
