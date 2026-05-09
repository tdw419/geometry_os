; DESCRIPTION: Renders a cyan line between points (35, 39) and (196, 194).
; PLAN: r0=35(x1), r1=39(y1), r2=196(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 39
LDI r2, 196
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
