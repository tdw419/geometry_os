; DESCRIPTION: Renders a cyan line between points (271, 198) and (80, 27).
; PLAN: r0=271(x1), r1=198(y1), r2=80(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 198
LDI r2, 80
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
