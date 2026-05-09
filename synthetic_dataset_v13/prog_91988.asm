; DESCRIPTION: Draws a black line from (295, 81) to (113, 221).
; PLAN: r0=295(x1), r1=81(y1), r2=113(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 81
LDI r2, 113
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
