; DESCRIPTION: Renders a cyan line between points (466, 64) and (502, 96).
; PLAN: r0=466(x1), r1=64(y1), r2=502(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 64
LDI r2, 502
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
