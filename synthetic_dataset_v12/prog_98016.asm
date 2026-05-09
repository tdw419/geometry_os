; DESCRIPTION: Renders a black line between points (445, 52) and (187, 164).
; PLAN: r0=445(x1), r1=52(y1), r2=187(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 52
LDI r2, 187
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
