; DESCRIPTION: Composite: Renders a purple line between points (96, 18) and (468, 99) then Places a cyan 104x56 rectangle at position (230, 93).
; PLAN: r0=96(x1), r1=18(y1), r2=468(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=230(x), r6=93(y), r7=104(width), r8=56(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 96
LDI r1, 18
LDI r2, 468
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 93
LDI r7, 104
LDI r8, 56
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
