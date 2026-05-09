; DESCRIPTION: Draws a magenta line from (86, 125) to (82, 213).
; PLAN: r0=86(x1), r1=125(y1), r2=82(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 125
LDI r2, 82
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
