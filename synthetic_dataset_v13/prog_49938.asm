; DESCRIPTION: Renders a cyan line between points (189, 210) and (58, 28).
; PLAN: r0=189(x1), r1=210(y1), r2=58(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 210
LDI r2, 58
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
