; DESCRIPTION: Renders a cyan line between points (400, 236) and (455, 143).
; PLAN: r0=400(x1), r1=236(y1), r2=455(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 236
LDI r2, 455
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
