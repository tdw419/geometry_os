; DESCRIPTION: Renders a cyan line between points (324, 243) and (384, 214).
; PLAN: r0=324(x1), r1=243(y1), r2=384(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 243
LDI r2, 384
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
