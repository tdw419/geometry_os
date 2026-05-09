; DESCRIPTION: Draws a yellow line from (154, 120) to (269, 134).
; PLAN: r0=154(x1), r1=120(y1), r2=269(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 120
LDI r2, 269
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
