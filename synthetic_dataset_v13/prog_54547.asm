; DESCRIPTION: Draws a cyan line from (21, 196) to (208, 15).
; PLAN: r0=21(x1), r1=196(y1), r2=208(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 196
LDI r2, 208
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
