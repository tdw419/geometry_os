; DESCRIPTION: Renders a cyan line between points (242, 59) and (441, 156).
; PLAN: r0=242(x1), r1=59(y1), r2=441(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 59
LDI r2, 441
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
