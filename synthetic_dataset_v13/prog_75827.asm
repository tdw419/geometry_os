; DESCRIPTION: Renders a cyan line between points (206, 202) and (100, 126).
; PLAN: r0=206(x1), r1=202(y1), r2=100(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 202
LDI r2, 100
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
