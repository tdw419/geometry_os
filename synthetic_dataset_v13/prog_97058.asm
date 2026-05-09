; DESCRIPTION: Draws a cyan line from (164, 98) to (388, 30).
; PLAN: r0=164(x1), r1=98(y1), r2=388(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 98
LDI r2, 388
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
