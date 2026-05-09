; DESCRIPTION: Draws a magenta line from (253, 51) to (228, 195).
; PLAN: r0=253(x1), r1=51(y1), r2=228(x2), r3=195(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 51
LDI r2, 228
LDI r3, 195
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
