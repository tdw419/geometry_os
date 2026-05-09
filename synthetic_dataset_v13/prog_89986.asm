; DESCRIPTION: Renders a white line between points (294, 162) and (303, 173).
; PLAN: r0=294(x1), r1=162(y1), r2=303(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 162
LDI r2, 303
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
