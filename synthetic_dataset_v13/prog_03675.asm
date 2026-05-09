; DESCRIPTION: Renders a cyan line between points (433, 27) and (152, 94).
; PLAN: r0=433(x1), r1=27(y1), r2=152(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 27
LDI r2, 152
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
