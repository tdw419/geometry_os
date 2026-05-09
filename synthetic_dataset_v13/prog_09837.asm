; DESCRIPTION: Renders a red line between points (69, 124) and (380, 164).
; PLAN: r0=69(x1), r1=124(y1), r2=380(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 124
LDI r2, 380
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
