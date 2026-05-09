; DESCRIPTION: Draws a cyan line from (417, 8) to (210, 140).
; PLAN: r0=417(x1), r1=8(y1), r2=210(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 8
LDI r2, 210
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
