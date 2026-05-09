; DESCRIPTION: Draws a magenta line from (213, 235) to (410, 193).
; PLAN: r0=213(x1), r1=235(y1), r2=410(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 235
LDI r2, 410
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
