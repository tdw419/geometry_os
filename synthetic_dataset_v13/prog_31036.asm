; DESCRIPTION: Composite: Places a blue line segment connecting (344, 224) to (261, 74) then Places a red dot at position (392, 191).
; PLAN: r0=344(x1), r1=224(y1), r2=261(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=392(x), r6=191(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 344
LDI r1, 224
LDI r2, 261
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 191
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
