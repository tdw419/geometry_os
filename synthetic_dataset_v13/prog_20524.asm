; DESCRIPTION: Draws a green line from (479, 179) to (470, 0).
; PLAN: r0=479(x1), r1=179(y1), r2=470(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 179
LDI r2, 470
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
