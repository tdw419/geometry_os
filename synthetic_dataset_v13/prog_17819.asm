; DESCRIPTION: Draws a cyan line from (98, 214) to (493, 146).
; PLAN: r0=98(x1), r1=214(y1), r2=493(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 214
LDI r2, 493
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
