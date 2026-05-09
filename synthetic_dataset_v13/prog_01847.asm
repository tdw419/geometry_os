; DESCRIPTION: Draws a cyan line from (300, 237) to (506, 48).
; PLAN: r0=300(x1), r1=237(y1), r2=506(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 237
LDI r2, 506
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
