; DESCRIPTION: Renders a cyan line between points (168, 180) and (332, 206).
; PLAN: r0=168(x1), r1=180(y1), r2=332(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 180
LDI r2, 332
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
