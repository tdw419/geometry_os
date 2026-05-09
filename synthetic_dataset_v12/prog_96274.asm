; DESCRIPTION: Renders a cyan line between points (0, 209) and (20, 86).
; PLAN: r0=0(x1), r1=209(y1), r2=20(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 209
LDI r2, 20
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
