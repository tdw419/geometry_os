; DESCRIPTION: Draws a cyan line from (291, 140) to (256, 71).
; PLAN: r0=291(x1), r1=140(y1), r2=256(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 140
LDI r2, 256
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
