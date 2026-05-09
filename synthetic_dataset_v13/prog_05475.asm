; DESCRIPTION: Renders a white line between points (329, 61) and (187, 146).
; PLAN: r0=329(x1), r1=61(y1), r2=187(x2), r3=146(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 61
LDI r2, 187
LDI r3, 146
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
