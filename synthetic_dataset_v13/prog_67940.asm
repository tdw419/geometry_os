; DESCRIPTION: Draws a cyan line from (269, 4) to (364, 247).
; PLAN: r0=269(x1), r1=4(y1), r2=364(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 4
LDI r2, 364
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
