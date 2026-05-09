; DESCRIPTION: Renders a cyan line between points (172, 113) and (59, 164).
; PLAN: r0=172(x1), r1=113(y1), r2=59(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 113
LDI r2, 59
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
