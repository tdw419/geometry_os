; DESCRIPTION: Renders a cyan line between points (270, 186) and (307, 242).
; PLAN: r0=270(x1), r1=186(y1), r2=307(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 186
LDI r2, 307
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
