; DESCRIPTION: Renders a cyan line between points (488, 175) and (406, 131).
; PLAN: r0=488(x1), r1=175(y1), r2=406(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 175
LDI r2, 406
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
