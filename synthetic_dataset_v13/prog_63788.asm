; DESCRIPTION: Draws a cyan line from (269, 0) to (332, 6).
; PLAN: r0=269(x1), r1=0(y1), r2=332(x2), r3=6(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 0
LDI r2, 332
LDI r3, 6
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
