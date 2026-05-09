; DESCRIPTION: Composite: Places a blue 110x93 rectangle at position (183, 9) then Places a orange dot at position (145, 6) then Draws a green line from (487, 129) to (162, 229).
; PLAN: r0=183(x), r1=9(y), r2=110(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x), r6=6(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=487(x1), r11=129(y1), r12=162(x2), r13=229(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 9
LDI r2, 110
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 6
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 487
LDI r11, 129
LDI r12, 162
LDI r13, 229
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
