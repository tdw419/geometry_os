; DESCRIPTION: Renders a cyan line between points (384, 246) and (57, 64).
; PLAN: r0=384(x1), r1=246(y1), r2=57(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 246
LDI r2, 57
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
