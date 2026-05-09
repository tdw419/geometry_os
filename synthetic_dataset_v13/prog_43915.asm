; DESCRIPTION: Composite: Sets a single orange pixel at (70, 231) then Places a yellow line segment connecting (161, 79) to (268, 198).
; PLAN: r0=70(x), r1=231(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=161(x1), r6=79(y1), r7=268(x2), r8=198(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 70
LDI r1, 231
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 161
LDI r6, 79
LDI r7, 268
LDI r8, 198
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
