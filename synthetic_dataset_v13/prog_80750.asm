; DESCRIPTION: Draws a white line from (505, 228) to (445, 160).
; PLAN: r0=505(x1), r1=228(y1), r2=445(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 228
LDI r2, 445
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
