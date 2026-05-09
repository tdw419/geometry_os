; DESCRIPTION: Renders a cyan line between points (233, 86) and (295, 235).
; PLAN: r0=233(x1), r1=86(y1), r2=295(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 86
LDI r2, 295
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
