; DESCRIPTION: Composite: Draws a green line from (224, 110) to (428, 56) then Places a orange 37x63 rectangle at position (168, 186).
; PLAN: r0=224(x1), r1=110(y1), r2=428(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=186(y), r7=37(width), r8=63(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 224
LDI r1, 110
LDI r2, 428
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 186
LDI r7, 37
LDI r8, 63
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
