; DESCRIPTION: Renders a cyan line between points (205, 96) and (330, 231).
; PLAN: r0=205(x1), r1=96(y1), r2=330(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 96
LDI r2, 330
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
