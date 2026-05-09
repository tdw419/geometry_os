; DESCRIPTION: Draws a magenta line from (309, 42) to (351, 243).
; PLAN: r0=309(x1), r1=42(y1), r2=351(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 42
LDI r2, 351
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
