; DESCRIPTION: Renders a cyan line between points (253, 195) and (370, 32).
; PLAN: r0=253(x1), r1=195(y1), r2=370(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 195
LDI r2, 370
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
