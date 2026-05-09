; DESCRIPTION: Renders a cyan line between points (280, 108) and (278, 102).
; PLAN: r0=280(x1), r1=108(y1), r2=278(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 108
LDI r2, 278
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
