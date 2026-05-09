; DESCRIPTION: Draws a cyan line from (349, 27) to (196, 56).
; PLAN: r0=349(x1), r1=27(y1), r2=196(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 27
LDI r2, 196
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
