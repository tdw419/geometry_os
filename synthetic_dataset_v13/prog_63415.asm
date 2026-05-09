; DESCRIPTION: Composite: Places a red line segment connecting (109, 118) to (108, 234) then Places a cyan 98x81 rectangle at position (79, 14).
; PLAN: r0=109(x1), r1=118(y1), r2=108(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=79(x), r6=14(y), r7=98(width), r8=81(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 109
LDI r1, 118
LDI r2, 108
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 14
LDI r7, 98
LDI r8, 81
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
