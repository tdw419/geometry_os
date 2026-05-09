; DESCRIPTION: Draws a cyan line from (378, 226) to (301, 111).
; PLAN: r0=378(x1), r1=226(y1), r2=301(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 226
LDI r2, 301
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
