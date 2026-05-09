; DESCRIPTION: Renders a cyan line between points (66, 128) and (53, 227).
; PLAN: r0=66(x1), r1=128(y1), r2=53(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 128
LDI r2, 53
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
