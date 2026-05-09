; DESCRIPTION: Renders a black line between points (401, 206) and (324, 69).
; PLAN: r0=401(x1), r1=206(y1), r2=324(x2), r3=69(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 206
LDI r2, 324
LDI r3, 69
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
