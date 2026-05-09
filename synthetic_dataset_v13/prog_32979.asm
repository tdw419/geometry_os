; DESCRIPTION: Draws a magenta line from (48, 157) to (197, 220).
; PLAN: r0=48(x1), r1=157(y1), r2=197(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 157
LDI r2, 197
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
