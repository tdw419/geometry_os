; DESCRIPTION: Draws a orange line from (464, 151) to (281, 213).
; PLAN: r0=464(x1), r1=151(y1), r2=281(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 151
LDI r2, 281
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
