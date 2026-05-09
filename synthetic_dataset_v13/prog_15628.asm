; DESCRIPTION: Renders a cyan line between points (171, 164) and (398, 90).
; PLAN: r0=171(x1), r1=164(y1), r2=398(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 164
LDI r2, 398
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
