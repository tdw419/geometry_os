; DESCRIPTION: Draws a yellow line from (298, 187) to (128, 188).
; PLAN: r0=298(x1), r1=187(y1), r2=128(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 187
LDI r2, 128
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
