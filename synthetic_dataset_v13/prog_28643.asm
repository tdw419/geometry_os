; DESCRIPTION: Draws a cyan line from (243, 253) to (150, 110).
; PLAN: r0=243(x1), r1=253(y1), r2=150(x2), r3=110(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 253
LDI r2, 150
LDI r3, 110
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
