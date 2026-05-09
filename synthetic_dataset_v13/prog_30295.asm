; DESCRIPTION: Renders a black line between points (187, 42) and (29, 91).
; PLAN: r0=187(x1), r1=42(y1), r2=29(x2), r3=91(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 42
LDI r2, 29
LDI r3, 91
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
