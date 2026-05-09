; DESCRIPTION: Renders a cyan line between points (463, 32) and (399, 46).
; PLAN: r0=463(x1), r1=32(y1), r2=399(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 32
LDI r2, 399
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
