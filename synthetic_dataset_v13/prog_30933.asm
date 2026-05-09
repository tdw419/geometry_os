; DESCRIPTION: Renders a white line between points (479, 245) and (169, 171).
; PLAN: r0=479(x1), r1=245(y1), r2=169(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 245
LDI r2, 169
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
