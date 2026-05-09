; DESCRIPTION: Places a cyan line segment connecting (270, 245) to (502, 237).
; PLAN: r0=270(x1), r1=245(y1), r2=502(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 245
LDI r2, 502
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
