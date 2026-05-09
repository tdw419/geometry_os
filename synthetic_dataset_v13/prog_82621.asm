; DESCRIPTION: Draws a green line from (111, 242) to (265, 187).
; PLAN: r0=111(x1), r1=242(y1), r2=265(x2), r3=187(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 242
LDI r2, 265
LDI r3, 187
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
