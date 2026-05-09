; DESCRIPTION: Composite: Places a green dot at position (82, 54) then Renders a blue line between points (406, 190) and (333, 173).
; PLAN: r0=82(x), r1=54(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=406(x1), r6=190(y1), r7=333(x2), r8=173(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 54
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 406
LDI r6, 190
LDI r7, 333
LDI r8, 173
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
