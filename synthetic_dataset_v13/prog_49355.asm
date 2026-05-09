; DESCRIPTION: Places a cyan line segment connecting (146, 230) to (195, 127).
; PLAN: r0=146(x1), r1=230(y1), r2=195(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 230
LDI r2, 195
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
