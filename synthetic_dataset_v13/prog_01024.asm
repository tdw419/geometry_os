; DESCRIPTION: Places a cyan line segment connecting (107, 206) to (127, 158).
; PLAN: r0=107(x1), r1=206(y1), r2=127(x2), r3=158(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 206
LDI r2, 127
LDI r3, 158
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
