; DESCRIPTION: Draws a black line from (295, 247) to (458, 214).
; PLAN: r0=295(x1), r1=247(y1), r2=458(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 247
LDI r2, 458
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
