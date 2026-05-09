; DESCRIPTION: Renders a cyan line between points (384, 224) and (423, 19).
; PLAN: r0=384(x1), r1=224(y1), r2=423(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 224
LDI r2, 423
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
