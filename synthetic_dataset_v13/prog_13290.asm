; DESCRIPTION: Draws a black line from (320, 242) to (204, 154).
; PLAN: r0=320(x1), r1=242(y1), r2=204(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 242
LDI r2, 204
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
