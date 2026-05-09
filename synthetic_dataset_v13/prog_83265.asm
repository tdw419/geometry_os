; DESCRIPTION: Renders a cyan line between points (79, 210) and (400, 135).
; PLAN: r0=79(x1), r1=210(y1), r2=400(x2), r3=135(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 210
LDI r2, 400
LDI r3, 135
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
