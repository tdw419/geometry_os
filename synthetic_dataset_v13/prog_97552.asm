; DESCRIPTION: Renders a cyan line between points (398, 242) and (454, 251).
; PLAN: r0=398(x1), r1=242(y1), r2=454(x2), r3=251(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 242
LDI r2, 454
LDI r3, 251
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
