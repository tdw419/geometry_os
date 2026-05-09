; DESCRIPTION: Renders a cyan line between points (365, 222) and (198, 14).
; PLAN: r0=365(x1), r1=222(y1), r2=198(x2), r3=14(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 222
LDI r2, 198
LDI r3, 14
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
