; DESCRIPTION: Draws a yellow line from (467, 204) to (228, 166).
; PLAN: r0=467(x1), r1=204(y1), r2=228(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 204
LDI r2, 228
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
