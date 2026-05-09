; DESCRIPTION: Draws a magenta line from (502, 14) to (480, 74).
; PLAN: r0=502(x1), r1=14(y1), r2=480(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 14
LDI r2, 480
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
