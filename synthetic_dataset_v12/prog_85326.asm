; DESCRIPTION: Renders a white line between points (187, 61) and (402, 213).
; PLAN: r0=187(x1), r1=61(y1), r2=402(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 61
LDI r2, 402
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
