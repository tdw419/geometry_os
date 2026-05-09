; DESCRIPTION: Composite: Draws a magenta line from (448, 104) to (189, 35) then Renders a cyan box of size 86x33 starting at (127, 8).
; PLAN: r0=448(x1), r1=104(y1), r2=189(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=127(x), r6=8(y), r7=86(width), r8=33(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 448
LDI r1, 104
LDI r2, 189
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 8
LDI r7, 86
LDI r8, 33
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
