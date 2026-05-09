; DESCRIPTION: Draws a white line from (504, 210) to (467, 150).
; PLAN: r0=504(x1), r1=210(y1), r2=467(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 210
LDI r2, 467
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
