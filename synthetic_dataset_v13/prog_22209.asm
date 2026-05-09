; DESCRIPTION: Composite: Places a cyan 94x120 rectangle at position (355, 35) then Draws a purple line from (462, 188) to (298, 95).
; PLAN: r0=355(x), r1=35(y), r2=94(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=462(x1), r6=188(y1), r7=298(x2), r8=95(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 355
LDI r1, 35
LDI r2, 94
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 462
LDI r6, 188
LDI r7, 298
LDI r8, 95
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
