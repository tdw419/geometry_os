; DESCRIPTION: Renders a cyan line between points (437, 175) and (268, 127).
; PLAN: r0=437(x1), r1=175(y1), r2=268(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 175
LDI r2, 268
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
