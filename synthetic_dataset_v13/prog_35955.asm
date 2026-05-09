; DESCRIPTION: Renders a white line between points (401, 197) and (286, 237).
; PLAN: r0=401(x1), r1=197(y1), r2=286(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 197
LDI r2, 286
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
