; DESCRIPTION: Draws a black line from (434, 171) to (363, 253).
; PLAN: r0=434(x1), r1=171(y1), r2=363(x2), r3=253(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 171
LDI r2, 363
LDI r3, 253
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
