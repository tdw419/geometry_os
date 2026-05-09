; DESCRIPTION: Draws a red line from (307, 249) to (507, 154).
; PLAN: r0=307(x1), r1=249(y1), r2=507(x2), r3=154(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 249
LDI r2, 507
LDI r3, 154
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
