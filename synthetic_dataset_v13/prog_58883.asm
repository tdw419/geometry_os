; DESCRIPTION: Composite: Renders a yellow box of size 32x27 starting at (448, 6) then Draws a blue line from (95, 19) to (69, 139).
; PLAN: r0=448(x), r1=6(y), r2=32(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x1), r6=19(y1), r7=69(x2), r8=139(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 448
LDI r1, 6
LDI r2, 32
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 19
LDI r7, 69
LDI r8, 139
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
