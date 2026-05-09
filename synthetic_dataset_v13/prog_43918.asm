; DESCRIPTION: Draws a cyan line from (491, 151) to (509, 51).
; PLAN: r0=491(x1), r1=151(y1), r2=509(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 151
LDI r2, 509
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
