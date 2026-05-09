; DESCRIPTION: Draws a cyan line from (196, 125) to (209, 115).
; PLAN: r0=196(x1), r1=125(y1), r2=209(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 125
LDI r2, 209
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
