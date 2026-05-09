; DESCRIPTION: Draws a cyan line from (388, 111) to (398, 66).
; PLAN: r0=388(x1), r1=111(y1), r2=398(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 111
LDI r2, 398
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
