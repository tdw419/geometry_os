; DESCRIPTION: Renders a cyan line between points (511, 183) and (271, 221).
; PLAN: r0=511(x1), r1=183(y1), r2=271(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 183
LDI r2, 271
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
