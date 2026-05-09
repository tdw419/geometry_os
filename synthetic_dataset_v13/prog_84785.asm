; DESCRIPTION: Renders a cyan line between points (180, 40) and (38, 166).
; PLAN: r0=180(x1), r1=40(y1), r2=38(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 40
LDI r2, 38
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
