; DESCRIPTION: Renders a cyan line between points (198, 164) and (2, 20).
; PLAN: r0=198(x1), r1=164(y1), r2=2(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 164
LDI r2, 2
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
