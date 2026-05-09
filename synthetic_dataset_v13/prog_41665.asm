; DESCRIPTION: Composite: Places a black 86x74 rectangle at position (410, 156) then Draws a red line from (123, 40) to (124, 13).
; PLAN: r0=410(x), r1=156(y), r2=86(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x1), r6=40(y1), r7=124(x2), r8=13(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 410
LDI r1, 156
LDI r2, 86
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 40
LDI r7, 124
LDI r8, 13
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
