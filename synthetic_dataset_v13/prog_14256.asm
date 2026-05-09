; DESCRIPTION: Draws a cyan line from (86, 27) to (454, 144).
; PLAN: r0=86(x1), r1=27(y1), r2=454(x2), r3=144(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 27
LDI r2, 454
LDI r3, 144
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
