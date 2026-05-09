; DESCRIPTION: Draws a cyan line from (252, 139) to (92, 209).
; PLAN: r0=252(x1), r1=139(y1), r2=92(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 139
LDI r2, 92
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
