; DESCRIPTION: Renders a cyan line between points (498, 222) and (333, 59).
; PLAN: r0=498(x1), r1=222(y1), r2=333(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 222
LDI r2, 333
LDI r3, 59
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
