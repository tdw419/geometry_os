; DESCRIPTION: Renders a red line between points (104, 213) and (287, 164).
; PLAN: r0=104(x1), r1=213(y1), r2=287(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 213
LDI r2, 287
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
