; DESCRIPTION: Draws a green line from (405, 146) to (460, 74).
; PLAN: r0=405(x1), r1=146(y1), r2=460(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 146
LDI r2, 460
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
