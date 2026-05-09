; DESCRIPTION: Draws a green line from (42, 86) to (307, 26).
; PLAN: r0=42(x1), r1=86(y1), r2=307(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 86
LDI r2, 307
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
