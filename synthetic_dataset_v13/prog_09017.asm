; DESCRIPTION: Composite: Creates a black rectangular region at (66, 132) spanning 80 by 120 pixels then Draws a green line from (468, 13) to (243, 157) then Sets a single purple pixel at (152, 37).
; PLAN: r0=66(x), r1=132(y), r2=80(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x1), r6=13(y1), r7=243(x2), r8=157(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=152(x), r11=37(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 66
LDI r1, 132
LDI r2, 80
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 13
LDI r7, 243
LDI r8, 157
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 152
LDI r11, 37
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
