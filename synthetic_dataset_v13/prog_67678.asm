; DESCRIPTION: Draws a yellow line from (494, 99) to (42, 213).
; PLAN: r0=494(x1), r1=99(y1), r2=42(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 99
LDI r2, 42
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
