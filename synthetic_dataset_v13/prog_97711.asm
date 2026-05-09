; DESCRIPTION: Renders a cyan line between points (204, 64) and (143, 146).
; PLAN: r0=204(x1), r1=64(y1), r2=143(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 64
LDI r2, 143
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
