; DESCRIPTION: Renders a cyan line between points (459, 100) and (27, 214).
; PLAN: r0=459(x1), r1=100(y1), r2=27(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 100
LDI r2, 27
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
