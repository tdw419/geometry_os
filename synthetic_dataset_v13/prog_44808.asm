; DESCRIPTION: Renders a green line between points (364, 204) and (268, 215).
; PLAN: r0=364(x1), r1=204(y1), r2=268(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 204
LDI r2, 268
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
