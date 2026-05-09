; DESCRIPTION: Renders a cyan line between points (290, 23) and (188, 242).
; PLAN: r0=290(x1), r1=23(y1), r2=188(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 23
LDI r2, 188
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
