; DESCRIPTION: Draws a magenta line from (346, 255) to (162, 213).
; PLAN: r0=346(x1), r1=255(y1), r2=162(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 255
LDI r2, 162
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
