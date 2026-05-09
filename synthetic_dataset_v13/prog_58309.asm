; DESCRIPTION: Draws a cyan line from (29, 127) to (305, 248).
; PLAN: r0=29(x1), r1=127(y1), r2=305(x2), r3=248(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 127
LDI r2, 305
LDI r3, 248
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
