; DESCRIPTION: Renders a green line between points (294, 192) and (329, 182).
; PLAN: r0=294(x1), r1=192(y1), r2=329(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 192
LDI r2, 329
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
