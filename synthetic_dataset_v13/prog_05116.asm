; DESCRIPTION: Renders a cyan line between points (425, 175) and (295, 160).
; PLAN: r0=425(x1), r1=175(y1), r2=295(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 175
LDI r2, 295
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
