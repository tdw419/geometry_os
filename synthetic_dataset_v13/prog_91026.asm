; DESCRIPTION: Renders a cyan line between points (210, 9) and (271, 251).
; PLAN: r0=210(x1), r1=9(y1), r2=271(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 9
LDI r2, 271
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
