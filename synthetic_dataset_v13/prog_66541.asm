; DESCRIPTION: Renders a cyan line between points (489, 240) and (30, 195).
; PLAN: r0=489(x1), r1=240(y1), r2=30(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 240
LDI r2, 30
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
