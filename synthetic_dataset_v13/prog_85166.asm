; DESCRIPTION: Renders a cyan line between points (1, 69) and (296, 59).
; PLAN: r0=1(x1), r1=69(y1), r2=296(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 69
LDI r2, 296
LDI r3, 59
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
