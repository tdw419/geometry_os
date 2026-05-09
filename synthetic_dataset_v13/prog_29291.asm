; DESCRIPTION: Composite: Places a yellow 20x35 rectangle at position (447, 2) then Draws a cyan line from (220, 190) to (205, 153).
; PLAN: r0=447(x), r1=2(y), r2=20(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=220(x1), r6=190(y1), r7=205(x2), r8=153(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 447
LDI r1, 2
LDI r2, 20
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 190
LDI r7, 205
LDI r8, 153
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
