; DESCRIPTION: Draws a yellow line from (281, 106) to (230, 125).
; PLAN: r0=281(x1), r1=106(y1), r2=230(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 106
LDI r2, 230
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
