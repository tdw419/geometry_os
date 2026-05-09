; DESCRIPTION: Draws a white line from (386, 228) to (400, 118).
; PLAN: r0=386(x1), r1=228(y1), r2=400(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 228
LDI r2, 400
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
