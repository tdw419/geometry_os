; DESCRIPTION: Draws a green line from (294, 205) to (204, 8).
; PLAN: r0=294(x1), r1=205(y1), r2=204(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 205
LDI r2, 204
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
