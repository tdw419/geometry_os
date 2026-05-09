; DESCRIPTION: Renders a cyan line between points (73, 237) and (289, 113).
; PLAN: r0=73(x1), r1=237(y1), r2=289(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 237
LDI r2, 289
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
