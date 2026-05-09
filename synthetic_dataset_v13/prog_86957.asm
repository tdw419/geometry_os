; DESCRIPTION: Renders a cyan line between points (250, 45) and (213, 214).
; PLAN: r0=250(x1), r1=45(y1), r2=213(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 45
LDI r2, 213
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
