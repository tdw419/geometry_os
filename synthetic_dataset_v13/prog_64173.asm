; DESCRIPTION: Draws a cyan line from (464, 166) to (207, 74).
; PLAN: r0=464(x1), r1=166(y1), r2=207(x2), r3=74(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 166
LDI r2, 207
LDI r3, 74
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
