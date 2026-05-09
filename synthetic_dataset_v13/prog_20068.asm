; DESCRIPTION: Composite: Draws a orange line from (214, 214) to (464, 93) then Places a orange 25x66 rectangle at position (264, 85).
; PLAN: r0=214(x1), r1=214(y1), r2=464(x2), r3=93(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=85(y), r7=25(width), r8=66(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 214
LDI r2, 464
LDI r3, 93
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 85
LDI r7, 25
LDI r8, 66
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
