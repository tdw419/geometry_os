; DESCRIPTION: Renders a cyan line between points (449, 173) and (118, 175).
; PLAN: r0=449(x1), r1=173(y1), r2=118(x2), r3=175(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 173
LDI r2, 118
LDI r3, 175
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
