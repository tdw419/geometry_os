; DESCRIPTION: Draws a cyan line from (132, 59) to (130, 220).
; PLAN: r0=132(x1), r1=59(y1), r2=130(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 59
LDI r2, 130
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
