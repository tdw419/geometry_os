; DESCRIPTION: Renders a green line between points (401, 96) and (362, 126).
; PLAN: r0=401(x1), r1=96(y1), r2=362(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 96
LDI r2, 362
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
