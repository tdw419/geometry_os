; DESCRIPTION: Draws a cyan line from (144, 195) to (277, 49).
; PLAN: r0=144(x1), r1=195(y1), r2=277(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 195
LDI r2, 277
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
