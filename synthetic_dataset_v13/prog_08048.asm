; DESCRIPTION: Draws a green line from (262, 27) to (96, 154).
; PLAN: r0=262(x1), r1=27(y1), r2=96(x2), r3=154(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 27
LDI r2, 96
LDI r3, 154
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
