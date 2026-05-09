; DESCRIPTION: Renders a cyan line between points (86, 239) and (461, 87).
; PLAN: r0=86(x1), r1=239(y1), r2=461(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 239
LDI r2, 461
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
