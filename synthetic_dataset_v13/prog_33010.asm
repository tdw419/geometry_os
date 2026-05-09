; DESCRIPTION: Composite: Places a magenta 16x120 rectangle at position (34, 56) then Draws a magenta line from (387, 1) to (475, 18) then Sets a single orange pixel at (83, 192).
; PLAN: r0=34(x), r1=56(y), r2=16(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=387(x1), r6=1(y1), r7=475(x2), r8=18(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=83(x), r11=192(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 34
LDI r1, 56
LDI r2, 16
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 1
LDI r7, 475
LDI r8, 18
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 83
LDI r11, 192
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
