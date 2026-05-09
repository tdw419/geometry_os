; DESCRIPTION: Draws a cyan line from (292, 182) to (504, 171).
; PLAN: r0=292(x1), r1=182(y1), r2=504(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 182
LDI r2, 504
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
