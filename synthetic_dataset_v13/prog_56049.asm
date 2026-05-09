; DESCRIPTION: Renders a cyan line between points (180, 221) and (285, 250).
; PLAN: r0=180(x1), r1=221(y1), r2=285(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 221
LDI r2, 285
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
