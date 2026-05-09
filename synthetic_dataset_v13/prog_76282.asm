; DESCRIPTION: Renders a cyan line between points (161, 191) and (352, 3).
; PLAN: r0=161(x1), r1=191(y1), r2=352(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 191
LDI r2, 352
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
