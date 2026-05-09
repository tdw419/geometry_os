; DESCRIPTION: Draws a cyan line from (438, 111) to (378, 202).
; PLAN: r0=438(x1), r1=111(y1), r2=378(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 111
LDI r2, 378
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
