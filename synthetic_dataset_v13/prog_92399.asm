; DESCRIPTION: Draws a cyan line from (424, 116) to (303, 221).
; PLAN: r0=424(x1), r1=116(y1), r2=303(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 116
LDI r2, 303
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
