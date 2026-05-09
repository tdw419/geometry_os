; DESCRIPTION: Renders a magenta line between points (398, 182) and (437, 222).
; PLAN: r0=398(x1), r1=182(y1), r2=437(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 182
LDI r2, 437
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
