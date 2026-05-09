; DESCRIPTION: Draws a cyan line from (33, 35) to (66, 154).
; PLAN: r0=33(x1), r1=35(y1), r2=66(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 35
LDI r2, 66
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
