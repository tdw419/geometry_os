; DESCRIPTION: Composite: Draws a purple line from (213, 72) to (70, 87) then Draws a cyan rectangle at (95, 127) with width 34 and height 16.
; PLAN: r0=213(x1), r1=72(y1), r2=70(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=127(y), r7=34(width), r8=16(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 213
LDI r1, 72
LDI r2, 70
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 127
LDI r7, 34
LDI r8, 16
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
