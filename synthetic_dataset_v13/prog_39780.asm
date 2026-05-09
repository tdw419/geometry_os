; DESCRIPTION: Composite: Draws a green line from (421, 252) to (256, 10) then Creates a cyan rectangular region at (151, 127) spanning 63 by 57 pixels.
; PLAN: r0=421(x1), r1=252(y1), r2=256(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=127(y), r7=63(width), r8=57(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 421
LDI r1, 252
LDI r2, 256
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 127
LDI r7, 63
LDI r8, 57
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
