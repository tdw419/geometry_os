; DESCRIPTION: Renders a white line between points (70, 161) and (213, 164).
; PLAN: r0=70(x1), r1=161(y1), r2=213(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 161
LDI r2, 213
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
