; DESCRIPTION: Draws a white line from (190, 56) to (410, 253).
; PLAN: r0=190(x1), r1=56(y1), r2=410(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 56
LDI r2, 410
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
