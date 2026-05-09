; DESCRIPTION: Renders a cyan line between points (35, 51) and (446, 214).
; PLAN: r0=35(x1), r1=51(y1), r2=446(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 51
LDI r2, 446
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
