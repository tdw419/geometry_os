; DESCRIPTION: Renders a cyan line between points (488, 188) and (409, 45).
; PLAN: r0=488(x1), r1=188(y1), r2=409(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 188
LDI r2, 409
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
