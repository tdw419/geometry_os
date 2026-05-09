; DESCRIPTION: Draws a cyan line from (332, 208) to (196, 163).
; PLAN: r0=332(x1), r1=208(y1), r2=196(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 208
LDI r2, 196
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
