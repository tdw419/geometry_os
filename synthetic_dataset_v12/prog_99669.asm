; DESCRIPTION: Renders a black line between points (46, 243) and (394, 207).
; PLAN: r0=46(x1), r1=243(y1), r2=394(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 243
LDI r2, 394
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
