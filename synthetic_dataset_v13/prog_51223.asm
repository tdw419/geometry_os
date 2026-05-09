; DESCRIPTION: Renders a black line between points (202, 242) and (150, 225).
; PLAN: r0=202(x1), r1=242(y1), r2=150(x2), r3=225(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 242
LDI r2, 150
LDI r3, 225
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
