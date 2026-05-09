; DESCRIPTION: Draws a red line from (196, 35) to (146, 215).
; PLAN: r0=196(x1), r1=35(y1), r2=146(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 35
LDI r2, 146
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
