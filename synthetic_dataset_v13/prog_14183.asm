; DESCRIPTION: Draws a green line from (464, 135) to (198, 213).
; PLAN: r0=464(x1), r1=135(y1), r2=198(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 135
LDI r2, 198
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
