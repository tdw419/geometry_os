; DESCRIPTION: Draws a green line from (129, 215) to (225, 242).
; PLAN: r0=129(x1), r1=215(y1), r2=225(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 215
LDI r2, 225
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
