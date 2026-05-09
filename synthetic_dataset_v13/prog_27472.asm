; DESCRIPTION: Renders a cyan line between points (92, 173) and (94, 249).
; PLAN: r0=92(x1), r1=173(y1), r2=94(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 173
LDI r2, 94
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
