; DESCRIPTION: Renders a cyan line between points (243, 33) and (388, 209).
; PLAN: r0=243(x1), r1=33(y1), r2=388(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 33
LDI r2, 388
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
