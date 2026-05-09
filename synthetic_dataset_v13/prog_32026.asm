; DESCRIPTION: Renders a cyan line between points (386, 76) and (293, 225).
; PLAN: r0=386(x1), r1=76(y1), r2=293(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 76
LDI r2, 293
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
