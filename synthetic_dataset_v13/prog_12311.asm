; DESCRIPTION: Renders a white line between points (410, 43) and (40, 166).
; PLAN: r0=410(x1), r1=43(y1), r2=40(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 43
LDI r2, 40
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
