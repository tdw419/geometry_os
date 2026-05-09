; DESCRIPTION: Draws a cyan line from (92, 210) to (29, 248).
; PLAN: r0=92(x1), r1=210(y1), r2=29(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 210
LDI r2, 29
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
