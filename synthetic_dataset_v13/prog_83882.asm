; DESCRIPTION: Renders a white line between points (340, 154) and (410, 216).
; PLAN: r0=340(x1), r1=154(y1), r2=410(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 154
LDI r2, 410
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
