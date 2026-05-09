; DESCRIPTION: Draws a cyan line from (45, 98) to (269, 20).
; PLAN: r0=45(x1), r1=98(y1), r2=269(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 98
LDI r2, 269
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
