; DESCRIPTION: Draws a cyan line from (459, 197) to (48, 130).
; PLAN: r0=459(x1), r1=197(y1), r2=48(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 197
LDI r2, 48
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
