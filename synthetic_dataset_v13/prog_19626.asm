; DESCRIPTION: Renders a cyan line between points (509, 252) and (285, 171).
; PLAN: r0=509(x1), r1=252(y1), r2=285(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 252
LDI r2, 285
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
