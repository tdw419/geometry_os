; DESCRIPTION: Draws a black line from (392, 210) to (507, 202).
; PLAN: r0=392(x1), r1=210(y1), r2=507(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 210
LDI r2, 507
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
