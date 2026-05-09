; DESCRIPTION: Draws a cyan line from (344, 202) to (464, 115).
; PLAN: r0=344(x1), r1=202(y1), r2=464(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 202
LDI r2, 464
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
