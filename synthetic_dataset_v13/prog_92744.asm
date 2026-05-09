; DESCRIPTION: Renders a black line between points (470, 239) and (92, 139).
; PLAN: r0=470(x1), r1=239(y1), r2=92(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 239
LDI r2, 92
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
