; DESCRIPTION: Renders a cyan line between points (332, 53) and (480, 156).
; PLAN: r0=332(x1), r1=53(y1), r2=480(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 53
LDI r2, 480
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
