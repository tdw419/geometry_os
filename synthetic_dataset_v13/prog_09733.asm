; DESCRIPTION: Renders a cyan line between points (273, 107) and (175, 67).
; PLAN: r0=273(x1), r1=107(y1), r2=175(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 107
LDI r2, 175
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
