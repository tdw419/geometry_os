; DESCRIPTION: Draws a green line from (198, 166) to (174, 215).
; PLAN: r0=198(x1), r1=166(y1), r2=174(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 166
LDI r2, 174
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
