; DESCRIPTION: Places a white line segment connecting (71, 41) to (279, 213).
; PLAN: r0=71(x1), r1=41(y1), r2=279(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 41
LDI r2, 279
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
