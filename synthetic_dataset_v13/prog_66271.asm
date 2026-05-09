; DESCRIPTION: Draws a red line from (228, 181) to (467, 177).
; PLAN: r0=228(x1), r1=181(y1), r2=467(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 181
LDI r2, 467
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
