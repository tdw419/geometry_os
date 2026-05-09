; DESCRIPTION: Renders a cyan line between points (237, 166) and (19, 249).
; PLAN: r0=237(x1), r1=166(y1), r2=19(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 166
LDI r2, 19
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
