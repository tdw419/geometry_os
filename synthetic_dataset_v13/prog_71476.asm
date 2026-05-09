; DESCRIPTION: Draws a cyan line from (256, 37) to (313, 154).
; PLAN: r0=256(x1), r1=37(y1), r2=313(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 37
LDI r2, 313
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
