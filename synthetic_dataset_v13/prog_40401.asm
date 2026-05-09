; DESCRIPTION: Draws a magenta line from (218, 146) to (281, 103).
; PLAN: r0=218(x1), r1=146(y1), r2=281(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 146
LDI r2, 281
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
