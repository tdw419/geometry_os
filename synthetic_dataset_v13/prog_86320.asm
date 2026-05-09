; DESCRIPTION: Draws a green line from (35, 230) to (168, 71).
; PLAN: r0=35(x1), r1=230(y1), r2=168(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 230
LDI r2, 168
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
