; DESCRIPTION: Composite: Places a cyan 77x102 rectangle at position (234, 11) then Renders a purple line between points (457, 221) and (428, 94).
; PLAN: r0=234(x), r1=11(y), r2=77(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=457(x1), r6=221(y1), r7=428(x2), r8=94(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 234
LDI r1, 11
LDI r2, 77
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 221
LDI r7, 428
LDI r8, 94
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
