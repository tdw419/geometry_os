; DESCRIPTION: Renders a cyan line between points (272, 236) and (375, 210).
; PLAN: r0=272(x1), r1=236(y1), r2=375(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 236
LDI r2, 375
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
