; DESCRIPTION: Draws a yellow line from (455, 221) to (465, 113).
; PLAN: r0=455(x1), r1=221(y1), r2=465(x2), r3=113(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 221
LDI r2, 465
LDI r3, 113
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
