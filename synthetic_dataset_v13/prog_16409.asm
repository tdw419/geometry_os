; DESCRIPTION: Renders a cyan line between points (440, 180) and (78, 173).
; PLAN: r0=440(x1), r1=180(y1), r2=78(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 180
LDI r2, 78
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
