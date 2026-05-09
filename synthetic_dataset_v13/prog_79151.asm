; DESCRIPTION: Draws a cyan line from (440, 182) to (69, 5).
; PLAN: r0=440(x1), r1=182(y1), r2=69(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 182
LDI r2, 69
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
